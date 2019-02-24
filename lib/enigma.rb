require "./lib/shifts"
require "./lib/letter_shift"
require "./lib/letter_shift_back"

class Enigma
  include LetterShift
  include LetterShiftBack

  attr_reader :shifts,
              :alphabet,
              :a_array,
              :b_array,
              :c_array,
              :d_array

  attr_writer :message #only for test...

  def initialize
    @shifts = Shifts.new
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    @a_array = []
    @b_array = []
    @c_array = []
    @d_array = []
  end

  def create_shifted_arrays(key,offset)
    while key == nil && offset == nil
      # key = @shifts.random_key
      # offset = @shifts.today_offset
    end
    @a_array = @alphabet.rotate(@shifts.shifts[:a])
    @b_array = @alphabet.rotate(@shifts.shifts[:b])
    @c_array = @alphabet.rotate(@shifts.shifts[:c])
    @d_array = @alphabet.rotate(@shifts.shifts[:d])
     #could use a while loop here
    # if @offset = nil
    # end
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
    create_shifted_arrays(key,offset)
    shift_all(message)
    encrypt_hash(message,key,offset)
  end

  def decrypt_hash(decryption,key,offset)
    {decryption: decryption,
    key: key,
    date: offset}
  end

  def decrypt(encryption,key,offset)
    @shifts.create_hashes(key,offset)
    create_shifted_arrays(key,offset)
    shift_all_back(encryption)
    decrypt_hash(encryption,key,offset)
  end
end
