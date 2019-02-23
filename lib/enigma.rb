require "./lib/shifts"

class Enigma
  attr_reader :message,
              :key,
              :offset,
              :shifts,
              :alphabet,
              :a_array,
              :b_array,
              :c_array,
              :d_array
  attr_writer :message #only for test...
  def initialize
    @message = nil
    @shifts = Shifts.new
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    @a_array = []
    @b_array = []
    @c_array = []
    @d_array = []
  end

  def create_shifted_arrays(key,offset)
    if key != nil && offset != nil
      # binding.pry
      @a_array = @alphabet.rotate(@shifts.shifts[:a])
      @b_array = @alphabet.rotate(@shifts.shifts[:b])
      @c_array = @alphabet.rotate(@shifts.shifts[:c])
      @d_array = @alphabet.rotate(@shifts.shifts[:d])
    end
     #could use a while loop here
    # if @offset = nil
    # end
  end

  def char_index
    @message.chars.map {|char| @alphabet.index(char)}
  end

  def shift_a
    count = 0
    char_index.each_with_index do |char,index|
      if index == count
        @message[index] = @a_array[char]
        count += 4
      end
    end
    @message
  end

  def shift_b
    count = 1
    char_index.each_with_index do |char,index|
      if index == count
        @message[index] = @b_array[char]
        count += 4
      end
    end
    @message
  end

  def shift_c
    count = 2
    char_index.each_with_index do |char,index|
      if index == count
        @message[index] = @c_array[char]
        count += 4
      end
    end
    @message
  end

  def shift_d
    count = 3
    char_index.each_with_index do |char,index|
      if index == count
        @message[index] = @d_array[char]
        count += 4
      end
    end
    @message
  end

  def shift_all
    shift_a
    shift_b
    shift_c
    shift_d
  end

  def encrypt_hash(encryption,key,offset)
    {encryption: encryption,
    key: key,
    date: offset}
  end

  def encrypt(message,key,offset)
    @message = message
    @shifts.create_hashes(key,offset)
    create_shifted_arrays(key,offset)
    shift_all
    encrypt_hash(@message,key,offset)
  end


end
