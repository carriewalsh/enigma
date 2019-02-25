require "./lib/shifts"
require "./lib/letter_shift"
require "./lib/letter_shift_back"
require "./lib/decrypter"

class Enigma
  include LetterShift
  include LetterShiftBack
  include Decrypter

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

  def encrypt_hash(encryption,key,offset)
    {encryption: encryption,
    key: key,
    date: offset}
  end

  def encrypt(message,key,offset)
    message.downcase!
    @shifts.create_hashes(key,offset) #could this go in create_shifted_arrays?
    @shifts.create_shifted_arrays(key,offset)
    shift_all(message)
    encrypt_hash(message,key,offset)
  end
end
