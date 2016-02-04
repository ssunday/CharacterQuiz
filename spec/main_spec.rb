require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../main.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }

describe "Character Quiz Web App" do

  describe "gets" do

    it "home page" do
      get '/'
      expect(last_response).to be_ok
    end

    it "quiz page" do
      get '/quiz'
      expect(last_response).to be_ok
    end

  end

  it "post quiz redirects to results" do
    post '/quiz'
    follow_redirect!
    expect(last_request.path).to eq('/results')
  end

  it "post quiz redirects to results and can go to breakdown" do
    post '/quiz'
    follow_redirect!
    get '/breakdown'
    expect(last_response).to be_ok
  end

end
