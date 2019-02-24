require "./lib/offsets"

class Cracker
  include Offsets
  attr_reader :key,
              :shifts,
              :offsets,
              :keys,
              :letter_align
  def initialize
    @key = nil
    @shifts = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    @offsets = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    @keys = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    @letter_align = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
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

  def calculate_shifts
    @letter_align.each do |key,letter_pair|
      diff = @alphabet.index(letter_pair[1]) - @alphabet.index(letter_pair[0])
      diff > 0 ? @shifts[key] = diff : @shifts[key] = 27 + diff
    end
  end

  def calculate_keys(date)
    offset_integrated(date)
    @offsets.each do |letter,offset|
      @keys[letter] = @shifts[letter] - @offsets[letter]
    end
  end

end
