require "./lib/shifts"
require "./lib/encrypter"
require "./lib/cracker"

class Enigma
  include Encrypter
  include Cracker

  attr_reader :key,
              :shifts,
              :letter_align,
              :options_hash,
              :alphabet

  def initialize
    @key = nil
    @shifts = Shifts.new
    @alphabet = ("a".."z").to_a << " "
    @letter_align = {a: nil, b: nil, c: nil, d: nil}
    @options_hash = {first:[], second:[], third:[], fourth:[]}
  end
end
