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

    xit "results page" do
      get '/results'
      expect(last_response).to be_ok
    end

  end

end
