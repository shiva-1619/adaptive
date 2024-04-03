
def generate_random_string(length):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))


def test(request, course_id):
    if request.method == 'GET':
        request.session['course_id'] = course_id
        request.session['answered_questions'] = [] 
        course = Addcourse.objects.get(course_id=course_id)
        current_time = timezone.now().strftime("%Y-%m-%d %H:%M:%S")
        random_string = generate_random_string(4)
        test_name = f"Test for {course.course_name} ({current_time} {random_string})"
        
        student_id = request.session.get('student_id_after_login')
        user_test = UserTestModel.objects.create(test_name=test_name, test_user_id=student_id)
        request.session['user_test_id'] = user_test.pk
        question_qs = list(Question.objects.filter(course_id=course_id).order_by('?')[:10])
        descriptive_qs = list(DescriptiveQuestion.objects.filter(course_id=course_id).order_by('?')[:10])
        image_qs = list(ImageQuestion.objects.filter(course_id=course_id).order_by('?')[:10])
        all_questions = question_qs + descriptive_qs + image_qs
        shuffle(all_questions)
        first_question = all_questions[0]
        context = {'random_question': first_question}
        return render(request, "user/test.html", context)



def process_question(request):
    print("Inside process_question view")
    if request.method == 'POST':
        question_id = request.POST.get('question_id')
        question_method = request.POST.get('question_method')
        print("Question ID:", question_id)
        print("Question Method:", question_method)
        student_answer = None
        answered_questions = request.session.get('answered_questions', [])
        print("Answered Questions:", answered_questions)
        
        if len(answered_questions) >= 10:
            print("Test completed.")
            return redirect('test_result')
        
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
        answered_questions.append(question_type) 
        request.session['answered_questions'] = answered_questions
        
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
        
        course_id = request.session.get('course_id')
        question_qs = list(Question.objects.filter(course_id=course_id).order_by('?')[:10])
        descriptive_qs = list(DescriptiveQuestion.objects.filter(course_id=course_id).order_by('?')[:10])
        image_qs = list(ImageQuestion.objects.filter(course_id=course_id).order_by('?')[:10])
        all_questions = question_qs + descriptive_qs + image_qs
        print("All Questions:", all_questions)
        
        last_two_question_types = answered_questions[-2:]
        last_two_marks = [0, 0] if len(answered_questions) < 2 else [0 if answered_questions[-2:] == 'easy' else 1]
        print("Last Two Question Types:", last_two_question_types)
        print("Last Two Marks:", last_two_marks)
        
        next_question_type = determine_next_question_type(is_correct, last_two_question_types, last_two_marks)
        print("Next Question Type:", next_question_type)
        
        next_question_candidates = [question for question in all_questions if question.question_type == next_question_type]
        print("Next Question Candidates:", next_question_candidates)
        
        shuffle(next_question_candidates)
        next_question = next_question_candidates.pop() if next_question_candidates else None
        print("Next Question:", next_question)
        print("Exiting process_question view")
        
        return render(request, 'user/test.html', {'random_question': next_question})
    
    return redirect(reverse('test'))



def determine_next_question_type(is_correct, answered_questions, last_two_marks):
    print("Is Correct:", is_correct)
    print("Answered Questions:", answered_questions)
    print("Last Two Marks:", last_two_marks)

    if is_correct:
        return answered_questions[-1] if answered_questions else None
    else:
        if sum(last_two_marks) == 0:
            return answered_questions[-1] if answered_questions else None
        elif sum(last_two_marks) == 1:
            return answered_questions[-1] if len(answered_questions) >= 1 else None
        else:
            last_two_types = answered_questions[-2:]
            if last_two_types[0] == 'easy' and last_two_types[1] == 'easy':
                return 'medium'
            elif last_two_types[0] == 'medium' and last_two_types[1] == 'medium':
                return 'hard'
            else:
                return 'easy'