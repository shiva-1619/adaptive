from django.shortcuts import render,redirect,get_object_or_404
from django.core.paginator import Paginator
from userapp.models import *
from instructorapp.models import *
from django.contrib import messages

# Create your views here.
def admin_dashboard(request):
    total_students = StudentRegModel.objects.count()
    total_instructors = InstructorRegModel.objects.count()
    pending_instructors = InstructorRegModel.objects.filter(status='Pending').count()
    total_feedbacks = StudentFeedback.objects.count()
    context = {
        'total_students': total_students,
        'total_instructors': total_instructors,
        'pending_instructors': pending_instructors,
        'total_feedbacks': total_feedbacks,
    }
    return render(request, "admin/index.html", context)


def pending_ins(request):
    pending_instructors = InstructorRegModel.objects.filter(status='Pending')
    paginator = Paginator(pending_instructors, 5)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {'page_obj': page_obj}
    return render(request, "admin/pending-Instructors.html", context)



def accept_instructor(request, instructor_id):
    instructor = InstructorRegModel.objects.get(pk=instructor_id)
    instructor.status = 'Accepted'
    instructor.save()
    messages.success(request,"Accepted !")
    return redirect('pending_ins')






def all_ins(request):
    accepted_instructors = InstructorRegModel.objects.filter(status='Accepted')
    paginator = Paginator(accepted_instructors, 5) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {
        'page_obj': page_obj
    }
    return render(request, "admin/all-Instructors.html", context)


def delete_instructor(request, id):
    instructor = get_object_or_404(InstructorRegModel, pk=id)
    instructor.delete()
    messages.success(request, f"Instructor {instructor.full_name} deleted successfully.")
    return redirect('all_ins')




def all_students(request):
    all_students = StudentRegModel.objects.all()
    paginator = Paginator(all_students, 5) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, "admin/all-students.html", {'students': page_obj})


def remove_student(request, id):
    student = StudentRegModel.objects.get(pk=id)
    student_name = student.full_name 
    student.delete()
    messages.success(request, f"{student_name} has been successfully removed.")
    return redirect('all_students')



def view_feedbacks(request):
    feedbacks_list = StudentFeedback.objects.all()
    paginator = Paginator(feedbacks_list, 5)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'admin/admin-view-feedbacks.html', {'page_obj': page_obj})



def remove_feedback(request, feedback_id):
    feedback = StudentFeedback.objects.get(pk=feedback_id)
    feedback.delete()
    messages.success(request, 'Feedback removed successfully.')
    return redirect('view_feedbacks')






def feedbacks_graph(request):
    rating_counts = {
        'rating1': StudentFeedback.objects.filter(rating=1).count(),
        'rating2': StudentFeedback.objects.filter(rating=2).count(),
        'rating3': StudentFeedback.objects.filter(rating=3).count(),
        'rating4': StudentFeedback.objects.filter(rating=4).count(),
        'rating5': StudentFeedback.objects.filter(rating=5).count(),
    }
    return render(request,"admin/graph-feedback.html", {'rating_counts': rating_counts})