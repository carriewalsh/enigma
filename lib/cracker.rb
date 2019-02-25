require "./lib/offsets"
require "./lib/wrongs"

class Cracker
  include Offsets
  include Wrongs
  attr_reader :key,
              :shifts,
              :offsets,
              :keys,
              :letter_align,
              :options_hash
  def initialize
    @key = nil
    @shifts = {a: nil, b: nil, c: nil, d: nil}
    @offsets = {a: nil, b: nil, c: nil, d: nil}
    @keys = {a: nil, b: nil, c: nil, d: nil}
    @letter_align = {a: nil, b: nil, c: nil, d: nil}
    @options_hash = {first:[],
                    second:[],
                    third:[],
                    fourth:[]}
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
    @keys.each do |letter,key|
      @keys[letter] = key.to_s.rjust(2,"0")
    end
  end

  def options_array(key,ordinal)
    @options_hash[ordinal] << key
    @options_hash[ordinal] << (key.to_i + 27).to_s
    @options_hash[ordinal] << (key.to_i + 54).to_s
    @options_hash[ordinal] << (key.to_i + 81).to_s
  end

  def all_option_arrays
    options_array(@keys[:a],:first)
    options_array(@keys[:b],:second)
    options_array(@keys[:c],:third)
    options_array(@keys[:d],:fourth)
  end

  def check_digit(ones_num,array)
    array.any? {|tens_num| tens_num[0] == ones_num[1]}
  end

  def find_key
    remove_fourth_wrongs
    remove_third_wrongs
    remove_second_wrongs
    remove_first_wrongs
    @key = (@options_hash[:first].first + @options_hash[:third].first + @options_hash[:fourth].first[1]).to_i
  end

  def crack(encryption,date)
    find_letter_align(encryption)
    calculate_shifts
    calculate_keys(date)
    all_option_arrays
    find_key
  end

end
