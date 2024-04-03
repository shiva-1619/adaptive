from django.shortcuts import render,redirect,get_object_or_404
from django.core.mail import send_mail
from django.contrib import messages
from django.conf import settings
from django.contrib.auth import logout
import os
from userapp.models import *
from instructorapp.models import *
from django.utils.datastructures import MultiValueDictKeyError
import random
import urllib.request
import urllib.parse
from onlinecourses.RazorPayApi import RazorpayClient
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponseBadRequest,HttpResponse
from django.db.models import Count
from django.core.paginator import Paginator
from random import sample

from django.utils.text import slugify
from django.utils import timezone

EMAIL_HOST_USER = os.environ.get('EMAIL_HOST_USER')
EMAIL_HOST_PASSWORD = os.environ.get('EMAIL_HOST_PASSWORD')


def generate_otp(length=4):
    otp = ''.join(random.choices('0123456789', k=length))
    return otp


def sendSMS(user,otp,mobile):
    data =  urllib.parse.urlencode({'username':'Codebook','apikey': '56dbbdc9cea86b276f6c' , 'mobile': mobile,
        'message' : f'Hello {user}, your OTP for account activation is {otp}. This message is generated from https://www.codebook.in server. Thank you', 'senderid': 'CODEBK'})
    data = data.encode('utf-8')
    request = urllib.request.Request("https://smslogin.co/v3/api.php?")
    f = urllib.request.urlopen(request, data)
    return f.read()




def student_logout(request):
    logout(request)
    messages.info(request,"Logout Successfully ")
    return redirect('student_login')

# Create your views here.

def index(requrest):
    return render(requrest,"user/index.html")



def about(request):
    return render(request,"user/about.html")


def student_login(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            student = StudentRegModel.objects.get(email=email)   
            if student.password == password:
                if student.otp_status == 'Verified':
                    messages.success(request, 'Login successful!')
                    request.session['student_id_after_login'] = student.student_id
                    return redirect('student_dashboard')
                else:
                    otp = generate_otp()
                    student.otp = otp
                    student.save()
                    subject = 'OTP Verification for Account Activation'
                    otp = f'Your OTP for verification is: {student.otp}'
                    message = f'Hello {student.full_name},\n\nYou are attempting to log in to your query account. Your OTP for login verification is: {otp}\n\nIf you did not request this OTP, please ignore this email.'
                    from_email = settings.EMAIL_HOST_USER
                    recipient_list = [student.email]
                    resp =  sendSMS(student.full_name, student.otp, student.phone_number)
                    send_mail(subject, message, from_email, recipient_list, fail_silently=False)
                    messages.success(request, 'Otp sent to mail and phone number !')
                    return redirect('otp')
            else:
                messages.error(request, 'Incorrect Password')
                return redirect('student_login')
        except StudentRegModel.DoesNotExist:
            messages.error(request, 'No User Found')
            return redirect('student_register')
    return render(request,"user/student-login.html")


def instructor_login(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('Password')
        try:
            ins = InstructorRegModel.objects.get(email=email)
            if ins.password == password:
                if ins.otp_status == 'Verified':
                    if ins.status == 'Accepted':
                        messages.success(request, 'Login successful!')
                        request.session['ins_id_after_login'] = ins.pk
                        return redirect('ins_dashboard')
                    else:
                        messages.error(request, 'Account not yet accepted')
                        return redirect('instructor_login')
                else:
                    otp = generate_otp()
                    ins.otp = otp
                    ins.save()
                    subject = 'OTP Verification for Account Activation'
                    otp_message = f'Your OTP for verification is: {ins.otp}'
                    message = f'Hello {ins.full_name},\n\nYou are attempting to log in to your account. {otp_message}\n\nIf you did not request this OTP, please ignore this message.'
                    from_email = settings.EMAIL_HOST_USER
                    recipient_list = [ins.email]
                    resp = sendSMS(ins.full_name, ins.otp, ins.phone_number)
                    send_mail(subject, message, from_email, recipient_list, fail_silently=False)
                    messages.success(request, 'Otp sent to mail and phone number!')
                    return redirect('instructorotp')
            else:
                messages.error(request, 'Incorrect Password')
                return redirect('instructor_login')
        except InstructorRegModel.DoesNotExist:
            messages.error(request, 'No User Found')
            return redirect('instructor_register')
    return render(request, "user/instructor-login.html")




def student_register(request):
    if request.method == "POST":
        name = request.POST.get('name')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        password = request.POST.get('password')
        location = request.POST.get('address')
        profile = request.FILES.get('profile')
        try:
            StudentRegModel.objects.get(email=email)
            messages.info(request, 'Email Already Exists!')
            return redirect('student_register')
        except StudentRegModel.DoesNotExist:
            otp = generate_otp()
            user = StudentRegModel.objects.create(full_name=name, email=email, phone_number=phone, photo=profile, password=password, address=location, otp=otp)
            print(user)
            resp = sendSMS(user.full_name, user.otp, user.phone_number)
            subject = 'OTP Verification for Account Activation'
            otp_message = f'Your OTP for verification is: {user.otp}'
            message = f'Hello {user.full_name},\n\nYou are attempting to Register an Account. {otp_message}\n\nIf you did not request this OTP, please ignore this message.'
            from_email = settings.EMAIL_HOST_USER
            recipient_list = [user.email]
            send_mail(subject, message, from_email, recipient_list, fail_silently=False)
            request.session['student_id'] = user.student_id
            print(request.session['student_id'])
            messages.info(request, 'OTP Sent To Email and Phone!')
            return redirect('otp')
    return render(request, "user/student-register.html")


def instructor_register(request):
    if request.method == "POST":
        name = request.POST.get('name')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        password = request.POST.get('password')
        location = request.POST.get('address')
        profile = request.FILES.get('profile')
        gender = request.POST.get('gender')
        try:
            InstructorRegModel.objects.get(email=email)
            messages.info(request, 'Email Already Exists!')
            return redirect('instructor_login')
        except InstructorRegModel.DoesNotExist:
            otp = generate_otp()
            ins = InstructorRegModel.objects.create(full_name=name, email=email, phone_number=phone, photo=profile, password=password, address=location, otp=otp)
            print(ins)
            resp = sendSMS(ins.full_name, ins.otp, ins.phone_number)
            subject = 'OTP Verification for Account Activation'
            otp_message = f'Your OTP for verification is: {ins.otp}'
            message = f'Hello {ins.full_name},\n\nYou are attempting to Register an Account. {otp_message}\n\nIf you did not request this OTP, please ignore this message.'
            from_email = settings.EMAIL_HOST_USER
            recipient_list = [ins.email]
            send_mail(subject, message, from_email, recipient_list, fail_silently=False)
            request.session['ins_id'] = ins.instructor_id
            messages.info(request, 'OTP Sent To Email and Phone!')
            return redirect('instructorotp')
    return render(request,"user/instructor-register.html")



def admin_login(request):
    if request.method == 'POST':
        username = request.POST.get('name')
        password = request.POST.get('password')
        if username == "admin"  and password == "admin":
            messages.success(request, 'Login Successfully.')
            return redirect('admin_dashboard')
        else:
            messages.error(request, 'Invalid username or password. Please try again.')
    return render(request,"user/admin-login.html")



def contact(request):
    return render(request,"user/contact.html")




def ins_otp(request):
    ins_id = request.session.get('ins_id')
    if request.method == "POST":
        otp_entered = request.POST.get('ins_otp')
        if not otp_entered:
            messages.error(request, 'Please enter the OTP')
            print("OTP not entered")
            return redirect('instructorotp')
        try:
            instructor = InstructorRegModel.objects.get(pk=ins_id)
            if str(instructor.otp) == otp_entered:
                instructor.otp_status = 'Verified'
                instructor.save()
                # user_id = request.session['user_id']
                messages.success(request, 'OTP verification successful!')
                return redirect('instructor_login')
            else:
                messages.error(request, 'Invalid OTP entered')
                print("Invalid OTP entered")
                return redirect('instructorotp')
        except instructor.DoesNotExist:
            messages.error(request, 'Invalid Instructor')
            print("Invalid Instructor")
            return redirect('instructor_register')
    return render(request,"user/ins-otp.html")




def otp(request):
    student_id = request.session.get('student_id')
    student = StudentRegModel.objects.get(student_id=student_id)
    if request.method == "POST":
        otp_entered = request.POST.get('otp')
        print(otp_entered,"otp enterd")
        print(student)
        if not otp_entered:
            messages.error(request, 'Please enter the OTP')
            print("OTP not entered")
            return redirect('otp')
        try:
            student = StudentRegModel.objects.get(student_id=student_id)
            if str(student.otp) == otp_entered:
                student.otp_status = 'Verified'
                student.save()
                # user_id = request.session['user_id']
                messages.success(request, 'OTP verification successful!')
                return redirect('student_login')
            else:
                messages.error(request, 'Invalid OTP entered')
                print("Invalid OTP entered")
                return redirect('otp')
        except student.DoesNotExist:
            messages.error(request, 'Invalid Student')
            print("Invalid Student")
            return redirect('student_register')
    return render(request,"user/otp.html")



# student views after login

def student_dashboard(request):
    return render(request,"user/student-dashboard.html")


def student_courses(request):
    all_courses = Addcourse.objects.all()
    for course_name in all_courses:
        print(course_name.course_name)
    return render(request, "user/student-courses.html", {'all_courses': all_courses})


def purchase_course(request, course_id):
    course = Addcourse.objects.get(pk=course_id)
    request.session['course_id_in_purchase_page'] = course.course_id
    return render(request, 'user/purchasepage.html', {'course': course})


def test_result(request):
    student_id = request.session.get('student_id_after_login')
    if student_id is not None:
        student_tests = UserTestModel.objects.filter(test_user_id=student_id).order_by('-id')
        paginator = Paginator(student_tests, 8)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        return render(request, "user/test-result.html", {'page_obj': page_obj})
    else:
        messages.error(request, "Student not logged in or session data missing")
        return redirect("student_login")




def my_courses(request):
    student_id = request.session.get('student_id_after_login')
    if student_id is None:
        messages.warning(request, "No student found, please login again!")
        return redirect('student_login')

    student_courses = StudentCourses.objects.filter(student_id=student_id)

    # Get the total count of questions from all three models for each course
    for student_course in student_courses:
        question_count = Question.objects.filter(course=student_course.course).count()
        descriptive_question_count = DescriptiveQuestion.objects.filter(course=student_course.course).count()
        image_question_count = ImageQuestion.objects.filter(course=student_course.course).count()
        total_question_count = question_count + descriptive_question_count + image_question_count
        student_course.total_question_count = total_question_count
    context = {
        'student_courses': student_courses,
    }
    return render(request, "user/my-courses.html", context)



from fuzzywuzzy import fuzz
from django.urls import reverse
from random import shuffle
from random import choice
from django.forms.models import model_to_dict
from collections import Counter
import string

def generate_random_string(length):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))





def test(request, course_id):
    request.session['course_id'] = course_id
    
    course = Addcourse.objects.get(course_id=course_id)
    request.session['answered_questions'] = [] 
    current_time = timezone.now().strftime("%Y-%m-%d %H:%M:%S")
    random_string = generate_random_string(4)
    test_name = f"Test for {course.course_name} ({current_time} {random_string})"
    student_id = request.session.get('student_id_after_login')
    user_test = UserTestModel.objects.create(test_name=test_name, test_user_id=student_id)
    request.session['user_test_id'] = user_test.pk
    return redirect('process_question')






def process_question(request):
    print("Inside process_question view")
    course_id = request.session.get('course_id')
    answered_questions = request.session.get('answered_questions', [])
    print("Answered Questions:", answered_questions)
    if len(answered_questions) >= 10:
            print("Test completed.")
            messages.success(request,"Questions Completed !")
            return redirect('test_result')
    else:
        question_qs = list(Question.objects.filter(course_id=course_id).order_by('?')[:10])
        descriptive_qs = list(DescriptiveQuestion.objects.filter(course_id=course_id).order_by('?')[:10])
        image_qs = list(ImageQuestion.objects.filter(course_id=course_id).order_by('?')[:10])
        all_questions = question_qs + descriptive_qs + image_qs
        shuffle(all_questions)
        first_question = all_questions[0]
        


    if request.method == 'POST':
        question_id = request.POST.get('question_id')
        question_method = request.POST.get('question_method')
        print("Question ID:", question_id)
        print("Question Method:", question_method)
        student_answer = None
        
        
        
        
        if question_method == "mcqs":
            student_answer = request.POST.get(f'question_{question_id}_answer')
            print("Student Answer (MCQs):", student_answer)
            question = Question.objects.get(pk=question_id)
            correct_answer = question.correct_answer
            print("Correct Answer (MCQs):", correct_answer)
            is_correct = student_answer == correct_answer
            print("Is Correct (MCQs):", is_correct)
            question_type = question.question_type
            print("Question Type (MCQs):", question_type)
        elif question_method == "descriptive":
            student_answer = request.POST.get('descriptive_answer')
            print("Student Answer (Descriptive):", student_answer)
            question = DescriptiveQuestion.objects.get(pk=question_id)
            correct_answer = question.correct_answer
            print("Correct Answer (Descriptive):", correct_answer)
            similarity_percentage = fuzz.partial_ratio(student_answer.lower(), correct_answer.lower())
            is_correct = similarity_percentage >= 85 
            print("Is Correct (Descriptive):", is_correct)
            question_type = question.question_type
            print("Question Type (Descriptive):", question_type)
        elif question_method == "image":
            student_answer = request.POST.get('image_answer') 
            print("Student Answer (Image):", student_answer)
            question = ImageQuestion.objects.get(pk=question_id)
            correct_answer = question.correct_answer
            print("Correct Answer (Image):", correct_answer)
            similarity_percentage = fuzz.partial_ratio(student_answer.lower(), correct_answer.lower())
            is_correct = similarity_percentage >= 85  
            print("Is Correct (Image):", is_correct)
            question_type = question.question_type 
            print("Question Type (Image):", question_type)
        
        user_test_id = request.session.get('user_test_id')
        user_test = UserTestModel.objects.get(pk=user_test_id)
        
        test_marks = 1 if is_correct else 0
        user_test.test_marks += test_marks
        user_test.save()
        
        
        
        student_id = request.session.get('student_id_after_login')
        result = ResultModel.objects.create(
            user_id=student_id,
            test_id=user_test.pk,
            test_name=user_test.test_name,
            question=question.question_text,
            useranswer=student_answer,
            correctanswer=correct_answer,
            marks=test_marks
        )
        # print("All Questions:", all_questions)
        answered_questions.append((int(question_id),question_type, is_correct))
        request.session['answered_questions'] = answered_questions

        # answered_questions = request.session.get('answered_questions', [])
        # print(answered_questions,"hey look here ")
        if len(answered_questions) >= 10:
            print("Test completed.")
            messages.success(request,"Question Completed !")
            return redirect('test_result')
        else:
            if len(answered_questions) > 1:
                print("Last 2 Answered Questions:", answered_questions[-2:])
                last_two_correct_answers = [answered_questions[-2][-1], answered_questions[-1][-1]]
                last_question_type = answered_questions[-1][1]
                print("Last Answered Question Type:", last_question_type,last_two_correct_answers)
                if last_two_correct_answers == [True, True]:
                    if last_question_type == 'easy':
                        next_question_type = 'medium'
                    elif last_question_type == 'medium':
                        next_question_type = 'hard'
                    else:
                        next_question_type = 'hard'  
                elif last_two_correct_answers == [False, False]:
                    if last_question_type == 'easy':
                        next_question_type = 'easy'
                    elif last_question_type == 'medium':
                        next_question_type = 'easy'
                    else:
                        next_question_type = 'medium'
                else:
                    next_question_type = last_question_type 
                answered_question_ids = [q[0] for q in answered_questions]
                question_qs = list(Question.objects.filter(course_id=course_id, question_type=next_question_type).exclude(pk__in=answered_question_ids).order_by('?')[:10])
                descriptive_qs = list(DescriptiveQuestion.objects.filter(course_id=course_id, question_type=next_question_type).exclude(pk__in=answered_question_ids).order_by('?')[:10])
                image_qs = list(ImageQuestion.objects.filter(course_id=course_id, question_type=next_question_type).exclude(pk__in=answered_question_ids).order_by('?')[:10])
                all_questions = question_qs + descriptive_qs + image_qs
                
                shuffle(all_questions)
                if all_questions:
                    next_question = all_questions[0]
                else:
                    messages.error(request, "No more questions available.")
                    return redirect('test_result')
            else:
                print("Answered Questions:", answered_questions)
                last_question_type = answered_questions[-1][1]
                print("Last Answered Question Type:", last_question_type)
                answered_question_ids = [q[0] for q in answered_questions]
                question_qs = list(Question.objects.filter(course_id=course_id, question_type=last_question_type).exclude(pk__in=answered_question_ids).order_by('?')[:10])
                descriptive_qs = list(DescriptiveQuestion.objects.filter(course_id=course_id, question_type=last_question_type).exclude(pk__in=answered_question_ids).order_by('?')[:10])
                image_qs = list(ImageQuestion.objects.filter(course_id=course_id, question_type=last_question_type).exclude(pk__in=answered_question_ids).order_by('?')[:10])
                all_questions = question_qs + descriptive_qs + image_qs
                
                shuffle(all_questions)
                if all_questions:
                    next_question = all_questions[0]
                else:
                    messages.error(request, "No more questions available.")
                    return redirect('test_result')
                print(next_question, "this is the next question !")
            return render(request, 'user/process-question.html', {'random_question': next_question})
    else:
        return render(request, 'user/process-question.html', {'random_question': first_question})






def submit_test(request, course_id):
    if request.method == 'POST':
        answers = {}
        for key, value in request.POST.items():
            if key.startswith('question_'):
                question_id = int(key.split('_')[1])
                answers[question_id] = value
        try:
            course = Addcourse.objects.get(pk=course_id)
        except Addcourse.DoesNotExist:
            messages.error(request, "Course not found.")
            return redirect('test')
        user_id = request.session.get('student_id_after_login')
        if not user_id:
            messages.error(request, "User not logged in.")
            return redirect('student_login') 
        course_name = course.course_name
        unique_identifier = slugify(course_name) 
        timestamp = timezone.now().strftime('%Y%m%d%H%M%S')
        user_test = UserTestModel.objects.create(
            test_user_id=user_id,
            test_name=f"Test for {course_name} ({unique_identifier}) - {timestamp}",
            test_marks=0
        )
        for question_id, answer in answers.items():
            try:
                question = Question.objects.get(pk=question_id)
            except Question.DoesNotExist:
                messages.error(request, "Question not found.")
                return redirect('test')  
            marks = 1 if answer == question.correct_answer else 0
            ResultModel.objects.create(
                user_id=user_id,
                test_id=user_test.id,
                test_name=user_test.test_name,
                question=question.question_text,
                useranswer=answer,
                correctanswer=question.correct_answer,
                marks=marks
            )
            user_test.test_marks += marks
        user_test.save()
        messages.success(request, "Test submitted successfully.")
        return redirect('test_result')
    else:
        messages.error(request, "Invalid request method.")
        return redirect('test')


def student_profile(request):
    student_id  = request.session['student_id_after_login']
    print(student_id)
    student = StudentRegModel.objects.get(student_id= student_id)
    if request.method == "POST":
        name = request.POST.get('name')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        try:
            profile = request.FILES['profile']
            student.photo = profile
        except MultiValueDictKeyError:
            profile = student.photo
        password = request.POST.get('password')
        location = request.POST.get('location')
        student.full_name = name
        student.email = email
        student.phone_number = phone
        student.password = password
        student.address = location
        student.save()
        messages.success(request , 'updated succesfully!')
        return redirect('student_profile')
    return render(request,"user/student-profile.html",{'student':student})




def view_details(request, test_id):
    test_results = ResultModel.objects.filter(test_id=test_id)
    total_marks = UserTestModel.objects.get(pk=test_id)
    total_marks_final = total_marks.test_marks
    correct_Answers = total_marks_final
    wrong_Answers = 10 - int(correct_Answers)
    percantage = (correct_Answers/10*100)
    results_details = []

    
    for result in test_results:
        results_details.append({
            'test_name': result.test_name,
            'question': result.question,
            'user_answer': result.useranswer,
            'correct_answer': result.correctanswer,
            'marks': result.marks
        })

        print("Correct Answer:", result.correctanswer)

    return render(request, "user/view-fulltest-deatils.html", 
                  {'results_details': results_details,
                   "total_marks_final":total_marks_final,
                   "correct_Answers":correct_Answers,
                   "wrong_Answers":wrong_Answers,
                   "percantage":percantage,})






def student_feedback(request):
    if request.method == 'POST':
        selected_course_name = request.POST.get('course_name')
        user_name = request.POST.get('user_name')
        user_email = request.POST.get('user_email')
        rating = int(request.POST.get('rating'))
        additional_comments = request.POST.get('additional_comments')
        
        student_id = request.session.get('student_id_after_login')
        
        if selected_course_name and user_name and user_email and student_id is not None:
            StudentFeedback.objects.create(
                student_id=student_id,
                course_name=selected_course_name,
                user_name=user_name,
                user_email=user_email,
                rating=rating,
                additional_comments=additional_comments
            )
            messages.success(request, 'Feedback submitted successfully.')
            return redirect('student_feedback')
        else:
            messages.error(request, 'Incomplete data. Please fill in all required fields.')
    student_id = request.session.get('student_id_after_login')
    if student_id:
        student_courses = StudentCourses.objects.filter(student_id=student_id).values_list('course__course_name', flat=True)
        context = {'student_courses': student_courses}
        return render(request, "user/student-feedback.html", context)
    else:
        messages.error(request, 'You need to be logged in to access this page.')
        return redirect('login')








from django.db import IntegrityError



def user_payment(request,id):
    student_id = request.session.get('student_id_after_login')
    if student_id is None:
        return HttpResponse("Student ID not found in session")
    print(student_id, "this is how I am getting student id")
    # buying_course_id = request.session.get('course_id_in_purchase_page')
    # if buying_course_id is None:
    #     return HttpResponse("Course ID not found in session")
    buying_course = Addcourse.objects.get(course_id=id)
    print(buying_course, "buying courses")
    try:
        student_course = StudentCourses.objects.get(course=buying_course, student_id=student_id)
        messages.error(request, 'You have already purchased this course')
        return redirect('student_courses')
    except Addcourse.DoesNotExist:
        return HttpResponse("Course not found")
    except StudentCourses.DoesNotExist:
        pass
    amount = buying_course.price * 100
    currency = 'INR'
    api = RazorpayClient()
    razorpay_order = api.create_order(amount)
    try:
        check = get_object_or_404(CartModel,cart_user_id=student_id)
        check.cart_booking = buying_course
        check.save(update_fields=["cart_booking"])
    except:
        CartModel.objects.create(cart_user_id=student_id,cart_booking=buying_course) 
    razorpay_order_id = razorpay_order['id']
    callback_url = '/paymenthandler/'
    context = {}
    context["buying_course"] = buying_course
    context["razorpay_order_id"] = razorpay_order_id
    context["razorpay_merchant_key"] = settings.RAZOR_KEY_ID
    context["amount"] = amount
    context["currency"] = currency
    context["callback_url"] = callback_url

    return render(request, 'user/purchasepage.html',context)


@csrf_exempt
def paymenthandler(request):
    if request.method == "POST":
        try:
            payment_id = request.POST.get('razorpay_payment_id', '')
            razorpay_order_id = request.POST.get('razorpay_order_id', '')
            signature = request.POST.get('razorpay_signature', '')
            params_dict = {
                'razorpay_order_id': razorpay_order_id,
                'razorpay_payment_id': payment_id,
                'razorpay_signature': signature
            }
            api = RazorpayClient()
            result = api.client.utility.verify_payment_signature(params_dict)
            if result:
                student_id = request.session.get('student_id_after_login')
                if student_id is None:
                    return HttpResponseBadRequest('Student ID not found in session')

                print(student_id, "Student ID")
                try:
                    user = StudentRegModel.objects.get(pk=student_id)
                except StudentRegModel.DoesNotExist:
                    return HttpResponseBadRequest('Student not found')

                cart = get_object_or_404(CartModel, cart_user=user)
                fee = cart.cart_booking.price
                amount = fee * 100  # Convert to paisa
                try:
                    api.client.payment.capture(payment_id, amount)
                    cart = get_object_or_404(CartModel, cart_user=user)
                    StudentCourses.objects.create(
                        student=user,
                        course=cart.cart_booking,
                        amount=fee,
                        payment_status="Successful",
                        payment_id=payment_id,
                        order_id=razorpay_order_id
                    )
                    messages.success(request, 'Payment successfully completed')
                    return redirect('my_courses')
                except Exception as e:
                    messages.error(request, 'Payment Failed: ' + str(e))
                    return redirect('student_courses')
            else:
                messages.error(request, 'Signature verification failed')
                return redirect('student_courses')
        except Exception as e:
            print("Error:", e)
            return HttpResponseBadRequest('An error occurred during payment processing')
    else:
        return HttpResponseBadRequest('Only POST requests are allowed')