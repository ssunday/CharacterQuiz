require 'sinatra'
require_relative "lib/questions_and_scoring.rb"

use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :expire_after => 2592000, # In seconds
                           :secret => 'spine'

include QuestionsAndScoring

get '/' do
  @title = "Home"
  session.clear
  erb :home
end

get '/quiz' do
  @title = "Quiz"
  @questions_and_answers = QUESTIONS_AND_ANSWERS
  erb :quiz
end

post '/quiz' do
  @title = "Quiz Scoring"
  session[:scores] = total_quiz_score(params)
  redirect '/results'
end

get '/results' do
  @title = "Quiz Results"
  @character = determine_character(session[:scores])
  erb :results
end

get '/breakdown' do
  @title = "Quiz Results Breakdown"
  @scoring_breakdown = match_up_characters_to_percentages(session[:scores])
  erb :breakdown
end

not_found do
	@title = "Not found!"
  erb :not_found
end
