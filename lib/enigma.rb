class Enigma
  attr_reader :message,
              :key,
              :offset
  def initialize(message: , key: nil, offset: nil)
    @message = message
    @key = key
    @offset = offset
  end
end
