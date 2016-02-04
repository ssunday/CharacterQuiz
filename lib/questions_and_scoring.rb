module QuestionsAndScoring

  QUESTIONS_AND_ANSWERS = {
    "What would you say is your best quality?" => ["Intelligence","Loyalty","Creativity","Compassion"],
    "Which ‘art’ is most important?" => ["Rationality" , "Spirituality", "Magic"],
    "If you could have one of these powers, which would you choose?" =>["Flight", "Control over an element","Magic", "Strength"],
    "Which is better: Organic or Non-Organic" => ["Organic", "Non-Organic"],
    "What do you do when confronted with a problem?" => ["Stick with it.", "Look for a different angle."],
    "What would your iconic piece of attire be?" => ["Helmet", "Cape", "Scarf", "Necklace"],
    "Should Tyra Tarkush (the holy language) be spoken?" => ["Yes", "Only in special circumstances", "No"],
    "Which one of these Gods would you be mostly likely to worship?" => ["Ra", "Hades", "Ganesh"],
    "Favorite color?" => ["Red", "Green", "Yellow", "Blue", "Black", "White"],
    "Dark or Light?" => ["Dark", "Light"],
    "How would you travel?" => ["Space ship", "Technological Teleportation", "Magical Teleportation", "Rifts"],
    "What is your hobby?" => ["Reading", "Philosophy", "Tinkering", "Exploring"],
    "Favorite music genre?" => ["Hip-hop", "Classical", "Rock", "Electronic"],
    "Hogwarts House?" => ["Gryffindor", "Slytherin", "Hufflepuff", "Ravenclaw"]
    }

  SCORING_MATRIX = {
    "question 1" => [[2,0,1,0],[0,2,0,1],[1,0,2,1],[0,1,0,2]],
    "question 2" => [[1,1,0,1],[2,0,1,2],[0,2,0,0]],
    "question 3" => [[2,0,1,2],[1,2,1,0],[0,0,2,0],[1,0,0,1]],
    "question 4" => [[1,1,2,1],[1,1,0,1]],
    "question 5" => [[0,2,1,1],[2,0,1,1]],
    "question 6" => [[1,2,0,0],[2,0,0,0],[0,0,2,1],[0,1,1,1]],
    "question 7" => [[2,0,1,0],[1,0,1,2],[0,2,0,0]],
    "question 8" => [[0,0,2,1],[0,1,0,0],[0,1,1,1]],
    "question 9" => [[1,0,1,1],[1,2,0,2],[0,0,2,0],[1,0,1,0],[1,1,0,0],[0,0,1,0]],
    "question 10" => [[2,2,0,0],[0,1,1,1]],
    "question 11" => [[1,2,0,0],[0,1,0,2],[0,0,2,1],[1,0,1,2]],
    "question 12" => [[0,1,2,1],[1,0,0,1],[2,0,0,0],[1,1,1,1]],
    "question 13" => [[2,0,0,1],[0,2,1,0],[0,2,0,0],[0,0,1,1]],
    "question 14" => [[0,2,0,1],[2,0,1,0],[0,1,0,2],[1,0,2,0]]
  }

  CHARACTERS = ["Cyclone", "King", "Spellbinder", "Farrco"]

  def total_quiz_score(params)
    total_score = [0,0,0,0]
    SCORING_MATRIX.each do |question, scores|
      question_scores = scores[params[question].to_i]
      total_score = total_score.zip(question_scores).map { |x, y| y + x }
    end
    total_score
  end

  def determine_character(total_score)
    max_character_score = total_score.max
    for i in 0..(CHARACTERS.length - 1)
      if max_character_score == total_score[i]
        return CHARACTERS[i]
      end
    end
  end

  def total_of_each_character_score
    total_scores = [0.0,0.0,0.0,0.0]
    SCORING_MATRIX.each do |question, scores|
      for i in 0..(scores.length - 1)
        total_scores = total_scores.zip(scores[i]).map { |score1, score2| score1 + score2 }
      end
    end
    total_scores
  end

  def percentage_of_each_character(scores)
    percentages = [0.0,0.0,0.0,0.0]
    total = total_of_each_character_score
    for i in 0..(scores.length - 1)
      percentages[i] = (scores[i]/total[i])*100.0
    end
    percentages
  end

  def match_up_characters_to_percentages(scores)
    characters_percentages = {}
    percentages = percentage_of_each_character(scores)
    for i in 0..(percentages.length - 1)
      characters_percentages[CHARACTERS[i]] = percentages[i]
    end
    characters_percentages
  end

  def tally_quiz_results(quiz_results)
    total_quiz_takers = 0
    final_results = [0,0,0,0]
    quiz_results.each do |result|
      for i in 0..(CHARACTERS.length - 1)
        if result.character.eql?(CHARACTERS[i])
          final_results[i] += 1
        end
      end
      total_quiz_takers += 1
    end

    percentages = [0.0,0.0,0.0,0.0]
    for i in 0..(final_results.length - 1)
      percentages[i] = (final_results[i]/total_quiz_takers)*100.0
    end

    quiz_percentages = {}
    for i in 0..(percentages.length - 1)
       quiz_percentages[CHARACTERS[i]] = percentages[i]
    end
    quiz_percentages
  end

end
