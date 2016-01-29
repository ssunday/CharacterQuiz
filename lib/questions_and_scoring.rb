module QuestionsAndScoring

  QUESTIONS_AND_ANSWERS = {
    "What would you say is your best quality?" => ["Intelligence","Loyalty","Creativity","Compassion"],
    "Which ‘art’ is most important?" => ["Rationality" , "Spirituality","Magic"],
    "If you could have one of these powers, which would you choose?" =>["Flight", "Control over an element","Magic", "Strength"],
    "Which is better: Organic or Non-Organics" => ["Organic", "Non-Organic"],
    "What do you do when confronted with a problem?" => ["Stick with it.", "Look for a different angle."]
    }

  SCORING_MATRIX = {
    "question 1" => [[2,0,1,0],[0,2,0,1],[1,0,2,1],[0,1,0,2]],
    "question 2" => [[1,1,0,1],[2,0,1,2],[0,2,0,0]],
    "question 3" => [[2,0,0,2],[1,2,1,0],[0,0,2,0],[1,0,0,1]],
    "question 4" => [[1,1,2,1],[1,1,0,1]],
    "question 5" => [[0,2,0,1],[2,0,1,1]]
  }

  CHARACTERS = ["Cyclone", "King", "Spellbinder", "Farrco"]


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
    percentages = [0,0,0,0]
    total = total_of_each_character_score
    for i in 0..(scores.length - 1)
      percentages[i] = (scores[i]/total[i])*100.0
    end
    percentages
  end

  def match_up_characters_to_percentages(scores)
    characters_percentages_hash = {}
    percentages = percentage_of_each_character(scores)
    for i in 0..(percentages.length - 1)
      characters_percentages_hash[CHARACTERS[i]] = percentages[i]
    end
    characters_percentages_hash
  end

end
