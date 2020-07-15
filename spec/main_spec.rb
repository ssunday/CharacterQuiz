require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../main.rb', __dir__

module RSpecMixin
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
end

RSpec.configure { |c| c.include RSpecMixin }

describe 'Character Quiz Web App' do
  describe 'gets' do
    it 'home page' do
      get '/'
      expect(last_response).to be_ok
    end
  end

  it 'post results is OK' do
    post '/results'

    expect(last_response).to be_ok
  end
end
