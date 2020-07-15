class QuizPage
  def initialize(questions_and_answers)
    @questions_and_answers = questions_and_answers
  end

  def show_questions_and_answers
    questions_and_answers_list = ''
    questions_and_answers_list += start_form
    questions_and_answers_list += add_questions_with_answers
    questions_and_answers_list += end_message
    questions_and_answers_list += end_form
    questions_and_answers_list
  end

  private

  def start_form
    "<form action='/quiz' method='post'>"
  end

  def add_questions_with_answers
    questions_with_answers = ''
    question_counter = 1
    @questions_and_answers.each do |question, answers|
      questions_with_answers += insert_question(question)
      questions_with_answers += add_answers(answers, question_counter)
      question_counter += 1
    end
    questions_with_answers
  end

  def add_answers(answers, question_number)
    question_answers = ''
    answer_counter = 0
    answers.each do |answer|
      question_answers += insert_answer(answer, question_number, answer_counter)
      answer_counter += 1
    end
    question_answers
  end

  def end_message
    '<br><h2>That is it! Now submit to see which character you are. </h2>'
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
