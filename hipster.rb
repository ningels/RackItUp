class Hipster
# Returns an array of text, the number of items in that array is
# sent by the calling application

@hipster = "Hipster: Mustache forage trust fund, austin cold-pressed man bun\n\n"

  def self.call(num=1)
    [@hipster * num]
  end

end
