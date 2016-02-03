class BreakdownPage

  def initialize(scoring_breakdown)
    @scoring_breakdown = scoring_breakdown
  end

  def show_percentage_breakdown
    percentage_breakdown = ""
    @scoring_breakdown.each do |character, percentage|
      percentage_breakdown += "<h2> #{character}</h2>"
      percentage_breakdown += "<h2> #{percentage.round}%<progress value='#{percentage}' max='100'></progress></h2>"
    end
    percentage_breakdown
  end

end
