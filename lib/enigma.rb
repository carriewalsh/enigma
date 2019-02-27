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
              :key_options_hash,
              :alphabet

  def initialize
    @key = nil
    @offset = nil
    @cipher = Cipher.new
    @alphabet = ("a".."z").to_a << " "
    @letter_align = {a: nil, b: nil, c: nil, d: nil}
    @key_options_hash = {first:[], second:[], third:[], fourth:[]}
  end

  def options_array(key,ordinal)
    @key_options_hash[ordinal] << key.to_s
    @key_options_hash[ordinal] << (key.to_i + 27).to_s
    @key_options_hash[ordinal] << (key.to_i + 54).to_s
    @key_options_hash[ordinal] << (key.to_i + 81).to_s
  end

  def all_option_arrays
    options_array(@cipher.keys[:a],:first)
    options_array(@cipher.keys[:b],:second)
    options_array(@cipher.keys[:c],:third)
    options_array(@cipher.keys[:d],:fourth)
  end

  def count_chars(message)
    message.length
  end

  def letter_pairs(message)
    [" ","e","n","d"].zip(message[-4,4].chars)
  end

  def find_letter_align(message)
    pairs = letter_pairs(message).rotate(-(message.length % 4))
    @letter_align[:a] = pairs[0]
    @letter_align[:b] = pairs[1]
    @letter_align[:c] = pairs[2]
    @letter_align[:d] = pairs[3]
  end
end
