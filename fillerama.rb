class Fillerama
# Returns an array of text, the number of items in that array is
# sent by the calling application

@fillerama = "fillerama:  Oh dear! She's stuck in an infinite loop, and he's an idiot!\n\n"

  def self.call(num=1)
    [@fillerama * num]
  end

end
