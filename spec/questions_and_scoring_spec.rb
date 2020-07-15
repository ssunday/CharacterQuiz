require 'rspec'
require 'questions_and_scoring'
include QuestionsAndScoring

describe QuestionsAndScoring do
  describe '#total_of_each_character_score' do
    it 'correctly totals up scores for each characters' do
      totals = total_of_each_character_score
      known_total = [55.0, 55.0, 55.0, 55.0]
      expect(totals).to eq known_total
    end
  end

  describe '#percentage_of_each_character' do
    it 'correctly gives percentages' do
      character_scores = [20, 20, 20, 20]
      known_percentage = [36.0, 36.0, 36.0, 36.0]
      percentages = percentage_of_each_character(character_scores)
      expect(percentages).to eq known_percentage
    end
  end

  describe '#match_up_characters_to_percentages' do
    it 'correctly gives characters and their percentages' do
      character_scores = [15, 20, 25, 10]
      known_characters_and_percentages = { CHARACTERS[0] => 27.0, CHARACTERS[1] => 36.0,\
                                           CHARACTERS[2] => 45.0, CHARACTERS[3] => 18.0 }
      characters_and_percentages = match_up_characters_to_percentages(character_scores)
      expect(characters_and_percentages).to eq known_characters_and_percentages
    end
  end

  describe '#determine_character' do
    it 'returns Cyclone when Cyclone is max' do
      total_score = [10, 0, 0, 0]
      expect(determine_character(total_score)).to eq 'Cyclone'
    end

    it 'returns King when King is max' do
      total_score = [0, 10, 0, 0]
      expect(determine_character(total_score)).to eq 'King'
    end

    it 'returns Spellbinder when Spellbinder is max' do
      total_score = [0, 0, 10, 0]
      expect(determine_character(total_score)).to eq 'Spellbinder'
    end

    it 'returns Farrco when Farrco is max' do
      total_score = [0, 0, 0, 10]
      expect(determine_character(total_score)).to eq 'Farrco'
    end
  end
end
