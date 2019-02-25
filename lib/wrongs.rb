module Wrongs

  def remove_invalid_numbers
    @options_hash.each do |letter,array|
      @options_hash[letter] = array.find_all {|option| option.length == 2}
    end
  end

  def remove_first_wrongs
    num = @options_hash[:first]
    [3,2,1,0].each do |number|
      if check_digit(num[number],@options_hash[:second]) == false
        @options_hash[:first].delete_at(number)
      end
    end
  end

  def remove_second_wrongs
    num = @options_hash[:second]
    [3,2,1,0].each do |number|
      if check_digit(num[number],@options_hash[:third]) == false
        @options_hash[:second].delete_at(number)
      end
    end
  end

  def remove_third_wrongs
    num = @options_hash[:third]
    [3,2,1,0].each do |number|
      if check_digit(num[number],@options_hash[:fourth]) == false
        @options_hash[:third].delete_at(number)
      end
    end
  end

  def remove_fourth_wrongs
    num = @options_hash[:fourth]
    [3,2,1,0].each do |number|
      if check_fourth_digit(num[number],@options_hash[:third]) == false
        @options_hash[:fourth].delete_at(number)
      end
    end
  end
end
