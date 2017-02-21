class Samuel
# Returns an array of text, the number of items in that array is
# sent by the calling application

@samuel = "Samuel: The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men.\n\n"

  def self.call(num=1)
    [@samuel * num]
  end

end
