require 'sinatra'
require_relative 'lib/questions_and_scoring.rb'
require_relative 'presenters/breakdown_page.rb'
require_relative 'presenters/results_page.rb'
require_relative 'presenters/quiz_page.rb'

include QuestionsAndScoring

get '/' do
  @title = 'Quiz Home'
  @view_quiz = QuizPage.new(QUESTIONS_AND_ANSWERS)
  erb :home
end

post '/results' do
  @title = 'Quiz Results'

  scores = total_quiz_score(params)
  @view_results = ResultsPage.new(determine_character(scores))
  @view_breakdown = BreakdownPage.new(match_up_characters_to_percentages(scores))

  erb :results
end

not_found do
  @title = 'Not Found!'
  erb :not_found
end
