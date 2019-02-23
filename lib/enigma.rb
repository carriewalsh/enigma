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
  def initialize(message: , key: nil, offset: nil)
    @message = message
    @key = key
    @offset = offset
    @shifts = nil
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    @a_array = []
    @b_array = []
    @c_array = []
    @d_array = []
  end

  def add_shifts(shifts)
    @shifts = shifts
  end

  def create_shifted_arrays(key,offset)
    @a_array = @alphabet.rotate(@shifts[:a])
    @b_array = @alphabet.rotate(@shifts[:b])
    @c_array = @alphabet.rotate(@shifts[:c])
    @d_array = @alphabet.rotate(@shifts[:d])



    # if @key == nil
    # end
    # if @offset = nil
    # end

  end


end
