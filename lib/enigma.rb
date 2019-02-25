require "./lib/shifts"
require "./lib/letter_shift"
require "./lib/letter_shift_back"
require "./lib/encrypter"
require "./lib/decrypter"
require "./lib/cracker"

class Enigma
  include LetterShift
  include LetterShiftBack
  include Encrypter
  include Decrypter
  include Cracker

  attr_reader :key,
              :shifts,
              :letter_align,
              :options_hash,
              :alphabet


  attr_writer :message #only for test...

  def initialize
    @key = nil
    @shifts = Shifts.new
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    @letter_align = {a: nil, b: nil, c: nil, d: nil}
    @options_hash = {first:[],
                    second:[],
                    third:[],
                    fourth:[]}
  end

  def char_index(message)
    message.chars.map {|char| @alphabet.index(char)}
  end
end
