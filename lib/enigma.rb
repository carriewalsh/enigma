require "./lib/cipher"
require "./lib/encrypter"
require "./lib/decrypter"
require "./lib/cracker"

class Enigma
  include Encrypter
  include Decrypter
  include Cracker

  attr_reader :key,
              :offset,
              :cipher,
              :letter_align,
              :options_hash,
              :alphabet

  def initialize
    @key = nil
    @offset = nil
    @cipher = Cipher.new
    @alphabet = ("a".."z").to_a << " "
    @letter_align = {a: nil, b: nil, c: nil, d: nil}
    @options_hash = {first:[], second:[], third:[], fourth:[]}
  end
end
