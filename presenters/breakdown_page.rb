class BreakdownPage

  def initialize(scoring_breakdown)
    @scoring_breakdown = scoring_breakdown
  end

  def show_percentage_breakdown
    percentage_breakdown = ""
    @scoring_breakdown.each do |character, percentage|
      percentage_breakdown += character_name(character)
      percentage_breakdown += percentage_bar(percentage)
    end
    percentage_breakdown
  end

  private

  def character_name(character)
    "<h2> #{character}</h2>"
  end

  def percentage_bar(percentage)
    "<h2> #{percentage}%<progress value='#{percentage}' max='100'></progress></h2>"
  end

end
