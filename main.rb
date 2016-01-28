require 'sinatra'

use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :expire_after => 2592000, # In seconds
                           :secret => 'spine'

get '/' do
  @title = "Home"
  session.clear
  erb :home
end

get '/quiz' do
  @title = "Quiz"
  @questions_and_answers = {
    "What would you say is your best quality?" => ["Intelligence","Loyalty","Creativity","Compassion"],
    "Which ‘art’ is most important?" => ["Rationality" , "Spirituality","Magic"],
    "If you could have one of these powers, which would you choose?" =>["Flight", "Control over an element","Magic", "Strength"],
    "Which is better: Organic or Non-Organics" => ["Organic", "Non-Organic"],
    "What do you do when confronted with a problem?" => ["Stick with it.", "Look for a different angle."]
    }
  erb :quiz
end

post '/quiz' do
  @title = "Quiz Scoring"
  session[:scores] = [0,0,0,0]
  scoring_matrix = {
    "question 1" => [[2,1,0,0],[0,0,2,1],[1,2,0,1],[0,0,1,2]],
    "question 2" => [[1,0,1,1],[2,1,0,2],[0,0,2,0]],
    "question 3" => [[2,0,0,2],[1,1,2,0],[0,2,0,0],[1,0,0,1]],
    "question 4" => [[1,2,1,1],[1,0,1,1]],
    "question 5" => [[0,0,2,1],[2,2,0,1]]
  }

  scoring_matrix.each do |question, scores|
    question_scores = scores[params[question].to_i]
    session[:scores] = session[:scores].zip(question_scores).map { |x, y| y + x }
  end
  redirect '/results'
end

get '/results' do
  @title = "Quiz Results"
  @character = "FAIL"
  characters = ["Cyclone", "King", "Spellbinder", "Farrco"]
  #max = session[:scores].max
  for i in 0..characters.length
    if session[:scores].max == session[:scores][i]
      @character = characters[i]
    end
  end
  erb :results
end
