
def process_question(request):
    print("Inside process_question view")
    course_id = request.session.get('course_id')
    answered_questions = request.session.get('answered_questions', [])
    print("Answered Questions:", answered_questions)
    if len(answered_questions) >= 10:
            print("Test completed.")
            messages.success(request,"Question Completed !")
            return redirect('test_result')
    
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
            next_question = all_questions[0]
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
            next_question = all_questions[0]
            print(next_question, "this is the next question !")
        return render(request, 'user/process-question.html', {'random_question': next_question})
    else:
        if len(answered_questions) == 0:
            question_qs = list(Question.objects.filter(course_id=course_id).order_by('?')[:10])
            descriptive_qs = list(DescriptiveQuestion.objects.filter(course_id=course_id).order_by('?')[:10])
            image_qs = list(ImageQuestion.objects.filter(course_id=course_id).order_by('?')[:10])
            all_questions = question_qs + descriptive_qs + image_qs
            shuffle(all_questions)
            first_question = all_questions[0]
        else:
            pass
    return render(request, 'user/process-question.html', {'random_question': first_question})