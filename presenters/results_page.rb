class ResultsPage

  def initialize(character)
    @character = character
  end

  def show_character_and_image
    character_and_image = ""
    character_and_image += "<h1 style='text-align:center;'> Your Character is: #{@character}!</h1>"
    character_and_image += "<p style='text-align:center;'><img src='images/#{@character}.png' alt='#{@character}' style='width:320px;height:510px;'></p>"
    character_and_image
  end
end
