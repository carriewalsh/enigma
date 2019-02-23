class Enigma
  attr_reader :message,
              :key,
              :offset,
              :alphabet
  def initialize(message: , key: nil, offset: nil)
    @message = message
    @key = key
    @offset = offset
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end
end
