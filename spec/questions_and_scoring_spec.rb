require 'rspec'
require 'questions_and_scoring'
include QuestionsAndScoring

describe QuestionsAndScoring do
  xit "correctly totals up scores for each characters" do
    totals = total_of_each_character_score
    expect(totals).to eq []
  end
end
