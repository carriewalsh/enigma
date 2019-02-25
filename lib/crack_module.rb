module CrackModule
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
