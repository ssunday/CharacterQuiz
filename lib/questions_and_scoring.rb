module QuestionsAndScoring
  QUESTIONS_AND_ANSWERS = {
    'What would you say is your best quality?' => %w[Intelligence Loyalty Creativity Compassion],
    'Which ‘art’ is most important?' => %w[Rationality Spirituality Magic],
    'If you could have one of these powers, which would you choose?' => ['Flight', 'Control over an element', 'Magic', 'Strength'],
    'Which is better: Organic or Non-Organic' => %w[Organic Non-Organic],
    'What do you do when confronted with a problem?' => ['Stick with it.', 'Look for a different angle.'],
    'What would your iconic piece of attire be?' => %w[Helmet Cape Scarf Necklace],
    'Should Tyra Tarkush (the holy language) be spoken?' => ['Yes', 'Only in special circumstances', 'No'],
    'Which one of these Gods would you be mostly likely to worship?' => %w[Ra Hades Ganesh],
    'Favorite color?' => %w[Red Green Yellow Blue Black White],
    'Dark or Light?' => %w[Dark Light],
    'How would you travel?' => ['Space ship', 'Technological Teleportation', 'Magical Teleportation', 'Rifts'],
    'What is your hobby?' => %w[Reading Philosophy Tinkering Exploring],
    'Favorite music genre?' => %w[Hip-hop Classical Rock Electronic],
    'Hogwarts House?' => %w[Gryffindor Slytherin Hufflepuff Ravenclaw],
    'What do you do when someone insults you?' => ['Insult them back wittily', 'Fight for your honor', 'Take it in stride', 'Ignore'],
    'How do you feel about Humans?' => ['Strange creatures', 'Inciting', 'No opinion'],
    'Element?' => %w[Fire Water Air Earth],
    'Sun or Moon?' => %w[Sun Moon],
    'Do you use social media?' => %w[Yes Occasionally No],
    'Which are you more?' => %w[Extroverted Introverted]
  }.freeze

  SCORING_MATRIX = {
    'question 1' => [[2, 0, 1, 0], [0, 2, 0, 1], [1, 0, 2, 0], [0, 1, 0, 2]],
    'question 2' => [[1, 2, 0, 1], [2, 1, 1, 2], [0, 0, 2, 0]],
    'question 3' => [[2, 0, 1, 2], [1, 2, 1, 0], [0, 0, 2, 0], [1, 1, 0, 2]],
    'question 4' => [[1, 1, 2, 0], [1, 1, 0, 2]],
    'question 5' => [[0, 2, 1, 1], [2, 0, 1, 1]],
    'question 6' => [[1, 2, 0, 0], [2, 0, 0, 0], [0, 0, 2, 1], [0, 1, 1, 2]],
    'question 7' => [[2, 0, 1, 0], [1, 1, 1, 2], [0, 2, 0, 0]],
    'question 8' => [[0, 0, 2, 1], [0, 1, 0, 0], [0, 1, 1, 1]],
    'question 9' => [[1, 0, 1, 2], [1, 2, 0, 2], [0, 0, 2, 0], [1, 0, 0, 0], [2, 2, 0, 0], [0, 0, 1, 0]],
    'question 10' => [[2, 2, 1, 0], [0, 1, 1, 2]],
    'question 11' => [[1, 2, 0, 0], [0, 1, 0, 2], [0, 0, 2, 0], [1, 0, 1, 2]],
    'question 12' => [[0, 1, 2, 1], [1, 0, 0, 1], [2, 0, 0, 0], [1, 1, 1, 1]],
    'question 13' => [[2, 0, 0, 1], [1, 2, 1, 0], [0, 1, 0, 0], [0, 0, 1, 1]],
    'question 14' => [[0, 2, 0, 1], [2, 0, 1, 0], [0, 1, 0, 2], [1, 0, 2, 0]],
    'question 15' => [[1, 2, 0, 0], [2, 1, 0, 0], [0, 0, 2, 1], [0, 0, 1, 2]],
    'question 16' => [[1, 2, 1, 0], [2, 1, 0, 0], [0, 0, 2, 3]],
    'question 17' => [[0, 1, 0, 2], [2, 0, 1, 0], [0, 0, 2, 0], [1, 2, 0, 1]],
    'question 18' => [[0, 1, 2, 1], [2, 1, 0, 1]],
    'question 19' => [[1, 0, 0, 2], [2, 1, 2, 1], [0, 2, 1, 0]],
    'question 20' => [[2, 0, 1, 1], [0, 2, 1, 1]]
  }.freeze

  CHARACTERS = %w[Cyclone King Spellbinder Farrco].freeze

  def total_quiz_score(params)
    total_score = [0, 0, 0, 0]
    SCORING_MATRIX.each do |question, scores|
      question_scores = scores[params[question].to_i]
      total_score = total_score.zip(question_scores).map { |x, y| y + x }
    end
    total_score
  end

  def determine_character(total_score)
    max_character_score = total_score.max
    (0..(CHARACTERS.length - 1)).each do |i|
      return CHARACTERS[i] if max_character_score == total_score[i]
    end
  end

  def total_of_each_character_score
    total_scores = [0.0, 0.0, 0.0, 0.0]
    SCORING_MATRIX.each do |_question, scores|
      (0..(scores.length - 1)).each do |i|
        total_scores = total_scores.zip(scores[i]).map { |score1, score2| score1 + score2 }
      end
    end
    total_scores
  end

  def percentage_of_each_character(scores)
    percentages = [0.0, 0.0, 0.0, 0.0]
    total = total_of_each_character_score
    (0..(scores.length - 1)).each do |i|
      percentages[i] = ((scores[i] / total[i]) * 100.0).round
    end
    percentages
  end

  def match_up_characters_to_percentages(scores)
    characters_percentages = {}
    percentages = percentage_of_each_character(scores)
    (0..(percentages.length - 1)).each do |i|
      characters_percentages[CHARACTERS[i]] = percentages[i]
    end
    characters_percentages
  end
end
