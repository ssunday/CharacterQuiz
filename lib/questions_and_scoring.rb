require_relative 'questions.rb'

module QuestionsAndScoring
  CHARACTERS = {
    cyclone: {
      name: 'Cyclone',
      image: 'https://www.thespineoftheempire.com/assets/images/art/propaganda/Cyclone-Propaganda.png'
    },
    king: {
      name: 'King',
      image: 'https://www.thespineoftheempire.com/assets/images/art/propaganda/King-Propaganda.png'
    },
    spellbinder: {
      name: 'Spellbinder',
      image: 'https://www.thespineoftheempire.com/assets/images/art/propaganda/Spellbinder-Propaganda.png'
    },
    farrco: {
      name: 'Farrco',
      image: 'https://www.thespineoftheempire.com/assets/images/art/propaganda/Farrco-Propaganda.png'
    },
    balon: {
      name: 'Balon Zfnoctewoohi',
      image: 'https://www.thespineoftheempire.com/assets/images/art/characters/balon/Balon-Zfnoctewoohi-back.jpg'
    },
    hequera: {
      name: 'Hequera',
      image: 'https://www.thespineoftheempire.com/assets/images/art/characters/hequera/Hequera-Portrait.jpg'
    }
  }.freeze

  class << self
    def total_quiz_score(params)
      total_scores = CHARACTERS.keys.map do |key|
        [key, 0]
      end.to_h

      questions_and_answers.each do |question, question_data|
        next unless params[question]

        question_data[:answers][params[question]].each do |character, val|
          total_scores[character] += val
        end
      end

      total_scores
    end

    def determine_character(total_score)
      max_character_score = total_score.max { |a, b| a.last <=> b.last }
      CHARACTERS[max_character_score.first]
    end

    def determine_character_percentage_breakdown(scores)
      scores.map { |key, val| [key, ((val / Questions::MAX_TOTAL.to_f) * 100.0).round] }.to_h
    end

    def questions_and_answers
      Questions::QUESTIONS_AND_ANSWERS
    end
  end
end
