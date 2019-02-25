require "./lib/shifts"
require "./lib/letter_shift"
require "./lib/letter_shift_back"
require "./lib/encrypter"
require "./lib/decrypter"
require "./lib/crack_module"

class Enigma
  include LetterShift
  include LetterShiftBack
  include Encrypter
  include Decrypter
  include CrackModule

  attr_reader :shifts,
              :alphabet


  attr_writer :message #only for test...

  def initialize
    @shifts = Shifts.new
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end

  def char_index(message)
    message.chars.map {|char| @alphabet.index(char)}
  end
end
