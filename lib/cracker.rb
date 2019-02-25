require "./lib/shifts"
require "./lib/wrongs"
require "./lib/letter_shift_back"
require "./lib/decrypter"
require "./lib/crack_module"

module Cracker
  include Wrongs
  include LetterShiftBack
  include Decrypter
  include CrackModule

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
      diff > 0 ? @shifts.shifts[key] = diff : @shifts.shifts[key] = 27 + diff
    end
  end

  def calculate_keys(date)
    @shifts.offset_integrated(date)
    @shifts.offsets.each do |letter,offset|
      @shifts.keys[letter] = @shifts.shifts[letter] - @shifts.offsets[letter]
    end
    @shifts.keys.each do |letter,key|
      @shifts.keys[letter] = key.to_s.rjust(2,"0")
    end
  end

  def options_array(key,ordinal)
    @options_hash[ordinal] << key
    @options_hash[ordinal] << (key.to_i + 27).to_s
    @options_hash[ordinal] << (key.to_i + 54).to_s
    @options_hash[ordinal] << (key.to_i + 81).to_s
  end

  def all_option_arrays
    options_array(@shifts.keys[:a],:first)
    options_array(@shifts.keys[:b],:second)
    options_array(@shifts.keys[:c],:third)
    options_array(@shifts.keys[:d],:fourth)
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
    decrypt(encryption,@key.to_s,date)
  end
end
