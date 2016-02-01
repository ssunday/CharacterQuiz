require 'data_mapper'

class Quiz
  include DataMapper::Resource
  property :id, Serial
  property :character, String
  #property :score, Object
end
