require "./lib/key_finder"
require "./lib/decrypter"
require "pry"

module Cracker
  include KeyFinder
  include Decrypter

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
