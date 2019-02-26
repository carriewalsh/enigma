require "./lib/shifts"
require "./lib/wrongs"
require "./lib/decrypter"
require "pry"

module Cracker
  include Wrongs
  include Decrypter

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
    @letter_align.each do |letter,letter_pair|
      diff = @alphabet.index(letter_pair[1]) - @alphabet.index(letter_pair[0])
      diff>0 ? @shifts.shifts[letter]=diff : @shifts.shifts[letter] = 27+diff
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
    key.to_i < 0 ? key = key.to_i + 27 : key
    @options_hash[ordinal] << key.to_s
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

  def check_digit(direction, number, array)
    if direction == "forward"
      array.any? {|tens_num| tens_num[0] == number[1]}
    elsif direction == "reverse"
      array.any? {|ones_num| number[0] == ones_num[1]}
    end
  end

  def find_key
    remove_invalid_numbers
    remove_wrongs_forward
    remove_wrongs_reverse
  end

  def print_key
    first = @options_hash[:first].first
    second = @options_hash[:second].find {|number| number[0] == first[1]}
    third = @options_hash[:third].find {|number| number[0] == second[1]}
    fourth = @options_hash[:fourth].find {|number| number[0] == third[1]}
    @key = @options_hash[:first].first + third + fourth[1]
  end

  def crack(encryption,date)
    find_letter_align(encryption)
    calculate_shifts
    calculate_keys(date)
    all_option_arrays
    find_key
    print_key
    decrypt(encryption,@key.to_s,date)
  end
end
