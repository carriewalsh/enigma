class Encrypter
  attr_reader :message,
              :key,
              :offset
  def initialize(message: , key:, offset:)
    @message = message
    @key = key
    @offset = offset
  end
end
