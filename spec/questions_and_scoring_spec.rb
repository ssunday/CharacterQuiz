require 'rspec'
require 'questions_and_scoring'
include QuestionsAndScoring

describe QuestionsAndScoring do

  describe "#total_of_each_character_score" do
    it "correctly totals up scores for each characters" do
      totals = total_of_each_character_score
      expect(totals).to eq [37.0,37.0,37.0,37.0]
    end
  end

  describe "#determine_character" do

    it "returns Cyclone when Cyclone is max" do
      total_score = [10,0,0,0]
      expect(determine_character(total_score)).to eq "Cyclone"
    end

    it "returns King when King is max" do
      total_score = [0,10,0,0]
      expect(determine_character(total_score)).to eq "King"
    end

    it "returns Spellbinder when Spellbinder is max" do
      total_score = [0,0,10,0]
      expect(determine_character(total_score)).to eq "Spellbinder"
    end

    it "returns Farrco when Farrco is max" do
      total_score = [0,0,0,10]
      expect(determine_character(total_score)).to eq "Farrco"
    end

  end


end
