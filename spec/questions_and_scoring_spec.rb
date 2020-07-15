require 'rspec'
require 'questions_and_scoring'

describe QuestionsAndScoring do
  describe '#total_quiz_score' do
    it 'it gives score based on params' do
      params = {
        quality: 'Creativity',
        element: 'Earth',
        intro_extro: 'Extroverted',
        art: 'Rationality',
        hogwarts: 'Ravenclaw'
      }
      scores = QuestionsAndScoring.total_quiz_score(params)
      expect(scores).to eq(
        cyclone: 6,
        king: 4,
        spellbinder: 4,
        farrco: 4,
        balon: 2,
        hequera: 2
      )
    end

    it 'handles no params' do
      scores = QuestionsAndScoring.total_quiz_score({})
      expect(scores).to eq(
        cyclone: 0,
        king: 0,
        spellbinder: 0,
        farrco: 0,
        balon: 0,
        hequera: 0
      )
    end
  end

  describe '#determine_character_percentage_breakdown' do
    it 'correctly gives characters and their percentages' do
      character_scores = {
        cyclone: 12,
        king: 5,
        spellbinder: 10,
        farrco: 3,
        balon: 0,
        hequera: 5
      }
      characters_and_percentages = QuestionsAndScoring.determine_character_percentage_breakdown(character_scores)
      expect(characters_and_percentages).to eq(
        cyclone: 60.0,
        king: 25.0,
        spellbinder: 50.0,
        farrco: 15.0,
        balon: 0,
        hequera: 25.0
      )
    end
  end

  describe '#determine_character' do
    it 'returns Cyclone when Cyclone is max' do
      total_score = {
        cyclone: 15.0,
        king: 5,
        spellbinder: 2,
        farrco: 3
      }
      expect(QuestionsAndScoring.determine_character(total_score)).to eq(QuestionsAndScoring::CHARACTERS[:cyclone])
    end

    it 'returns King when King is max' do
      total_score = {
        cyclone: 15.0,
        king: 25,
        spellbinder: 2,
        farrco: 3
      }
      expect(QuestionsAndScoring.determine_character(total_score)).to eq(QuestionsAndScoring::CHARACTERS[:king])
    end

    it 'returns Spellbinder when Spellbinder is max' do
      total_score = {
        cyclone: 15.0,
        king: 5,
        spellbinder: 22,
        farrco: 3
      }
      expect(QuestionsAndScoring.determine_character(total_score)).to eq(QuestionsAndScoring::CHARACTERS[:spellbinder])
    end

    it 'returns Farrco when Farrco is max' do
      total_score = {
        cyclone: 15.0,
        king: 5,
        spellbinder: 2,
        farrco: 33
      }
      expect(QuestionsAndScoring.determine_character(total_score)).to eq(QuestionsAndScoring::CHARACTERS[:farrco])
    end

    it 'returns Balon when Balon is max' do
      total_score = {
        cyclone: 15.0,
        king: 5,
        spellbinder: 2,
        balon: 33
      }
      expect(QuestionsAndScoring.determine_character(total_score)).to eq(QuestionsAndScoring::CHARACTERS[:balon])
    end

    it 'returns Hequera when Hequera is max' do
      total_score = {
        cyclone: 15.0,
        king: 5,
        spellbinder: 2,
        hequera: 33
      }
      expect(QuestionsAndScoring.determine_character(total_score)).to eq(QuestionsAndScoring::CHARACTERS[:hequera])
    end
  end
end
