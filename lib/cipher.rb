require "./lib/key_generator"
require "./lib/offset_generator"

class Cipher
  include KeyGenerator
  include OffsetGenerator

  attr_reader :keys,
              :offsets,
              :shifts,
              :a_array,
              :b_array,
              :c_array,
              :d_array

  def initialize
    @keys = {a: nil, b: nil, c: nil, d: nil}
    @offsets = {a: nil, b: nil, c: nil, d: nil}
    @shifts = {a: nil, b: nil, c: nil, d: nil}
    @alphabet = ("a".."z").to_a << " "
    @a_array = []
    @b_array = []
    @c_array = []
    @d_array = []
  end

  def create_shifts
    @shifts[:a] = @keys[:a] + @offsets[:a]
    @shifts[:b] = @keys[:b] + @offsets[:b]
    @shifts[:c] = @keys[:c] + @offsets[:c]
    @shifts[:d] = @keys[:d] + @offsets[:d]
  end

  def create_shifted_arrays(key,offset)
    @a_array = @alphabet.rotate(@shifts[:a])
    @b_array = @alphabet.rotate(@shifts[:b])
    @c_array = @alphabet.rotate(@shifts[:c])
    @d_array = @alphabet.rotate(@shifts[:d])
  end

  def create_hashes(key,offset)
    create_keys(key)
    offset_integrated(offset)
    create_shifts
  end
end
