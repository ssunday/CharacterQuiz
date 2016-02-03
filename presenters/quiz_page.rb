class QuizPage

  def initialize(questions_and_answers)
    @questions_and_answers = questions_and_answers
  end

  def show_questions_and_answers
    questions_and_answers_list = ""
    questions_and_answers_list += start_form
    question_counter = 1
    @questions_and_answers.each do |question, answers|
      questions_and_answers_list += insert_question(question)
    	answer_counter = 0
      answers.each do |answer|
          questions_and_answers_list += insert_answer(answer, question_counter, answer_counter)
    			answer_counter += 1
      end
    	question_counter += 1
    end
    questions_and_answers_list += end_form
    questions_and_answers_list
  end

  private

  def start_form
    "<form action='/quiz' method='post'>"
  end

  def end_form
    '<br><br><input type="submit"></form>'
  end

  def insert_question(question)
    "<br><h2>#{question}</h2><br>"
  end

  def insert_answer(answer, question_counter, answer_counter)
    "<label>#{answer}</label>
    <input type='radio' name='question #{question_counter}' value= '#{answer_counter}' checked/><br>"
  end

end
