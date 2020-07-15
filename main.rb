require 'sinatra'
require_relative 'lib/questions_and_scoring.rb'

get '/' do
  @title = 'Quiz Home'
  @questions_and_answers = QuestionsAndScoring.questions_and_answers
  erb :home
end

post '/results' do
  @title = 'Quiz Results'

  scores = QuestionsAndScoring.total_quiz_score(params)
  @character = QuestionsAndScoring.determine_character(scores)
  @scoring_breakdown = QuestionsAndScoring.determine_character_percentage_breakdown(scores)

  erb :results
end

not_found do
  @title = 'Not Found!'
  erb :not_found
end
