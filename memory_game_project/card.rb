class Card
  attr_reader :face_value, :hidden

  def initialize(face_value)
    @face_value = face_value
    @hidden = true
  end

  def hide
    @hidden = true unless @hidden
  end

  def reveal
    @hidden = false if @hidden
  end

  def to_s

  end

  def ==(card)
    self.face_value == card.face_value
  end

  def display_card
    if @hidden
      "❓"
    else
      "#{self.face_value} "
    end
  end

end

# in initialize:
# keep track of face value, face up or face down

#display info about the card, if down nothing, else value
