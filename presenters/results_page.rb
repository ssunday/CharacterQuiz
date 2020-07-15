class ResultsPage
  def initialize(character)
    @character = character
  end

  def show_character_and_image
    character_and_image = ''
    character_and_image += character_name_message
    character_and_image += character_image
    character_and_image
  end

  private

  def character_image
    "<p style='text-align:center;'><img src='images/#{@character}.png' alt='#{@character}' style='width:320px;height:510px;'></p>"
  end

  def character_name_message
    "<h1 style='text-align:center;'> Your Character is: #{@character}!</h1>"
  end
end
