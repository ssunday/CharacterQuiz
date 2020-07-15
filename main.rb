require 'sinatra'
require_relative 'lib/questions_and_scoring.rb'
require_relative 'presenters/breakdown_page.rb'
require_relative 'presenters/results_page.rb'
require_relative 'presenters/quiz_page.rb'

use Rack::Session::Cookie, key: 'rack.session',
                           path: '/',
                           expire_after: 2_592_000, # In seconds
                           secret: 'spine'

include QuestionsAndScoring

get '/' do
  @title = 'Home'
  session.clear
  erb :home
end

get '/quiz' do
  @title = 'Quiz'
  @view_quiz = QuizPage.new(QUESTIONS_AND_ANSWERS)
  erb :quiz
end

post '/quiz' do
  @title = 'Quiz Scoring'
  session[:scores] = total_quiz_score(params)
  redirect '/results'
end

get '/results' do
  @title = 'Quiz Results'
  @view_results = ResultsPage.new(determine_character(session[:scores]))
  erb :results
end

get '/breakdown' do
  @title = 'Quiz Results Breakdown'
  @view_breakdown = BreakdownPage.new(match_up_characters_to_percentages(session[:scores]))
  erb :breakdown
end

not_found do
  @title = 'Not Found!'
  erb :not_found
end
