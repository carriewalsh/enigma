require "./lib/key_finder"
require "./lib/decrypter"

module Cracker
  include KeyFinder
  include Decrypter

  def crack(encryption,date)
    if date == nil
      @offset = @cipher.today_offset
    else
      @offset = date
    end
    find_letter_align(encryption)
    calculate_shifts
    calculate_keys(@offset)
    all_option_arrays
    find_key
    print_key
    decrypt(encryption,@key.to_s,@offset)
  end
end
