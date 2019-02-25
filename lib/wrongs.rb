module Wrongs

  def remove_invalid_numbers
    @options_hash.each do |letter,array|
      @options_hash[letter] = array.find_all {|option| option.length == 2}
    end
  end

  def remove_first_wrongs_forward
    num = @options_hash[:first]
    range = (0...num.length).to_a.reverse
    range.each do |number|
      if check_digit(num[number],@options_hash[:second]) == false
        @options_hash[:first].delete_at(number)
      end
    end
  end

  def remove_second_wrongs_forward
    num = @options_hash[:second]
    range = (0...num.length).to_a.reverse
    range.each do |number|
      if check_digit(num[number],@options_hash[:third]) == false
        @options_hash[:second].delete_at(number)
      end
    end
  end

  def remove_second_wrongs_reverse
    num = @options_hash[:second]
    range = (0...num.length).to_a.reverse
    range.each do |number|
      if check_digit_reverse(num[number],@options_hash[:first]) == false
        @options_hash[:second].delete_at(number)
      end
    end
  end

  def remove_second_wrongs
    remove_second_wrongs_forward
    remove_second_wrongs_reverse
  end

  def remove_third_wrongs_forward
    num = @options_hash[:third]
    range = (0...num.length).to_a.reverse
    range.each do |number|
      if check_digit(num[number],@options_hash[:fourth]) == false
        @options_hash[:third].delete_at(number)
      end
    end
  end

  def remove_third_wrongs_reverse
    num = @options_hash[:third]
    range = (0...num.length).to_a.reverse
    range.each do |number|
      if check_digit_reverse(num[number],@options_hash[:second]) == false
        @options_hash[:third].delete_at(number)
      end
    end
  end

  def remove_third_wrongs
    remove_third_wrongs_forward
    remove_third_wrongs_reverse
  end

  def remove_fourth_wrongs_reverse
    num = @options_hash[:fourth]
    range = (0...num.length).to_a.reverse
    range.each do |number|
      if check_digit_reverse(num[number],@options_hash[:third]) == false
        @options_hash[:fourth].delete_at(number)
      end
    end
  end

  def remove_wrongs_forward
    remove_first_wrongs_forward
    remove_second_wrongs
    remove_third_wrongs
    remove_fourth_wrongs_reverse
  end

  def remove_wrongs_reverse
    remove_fourth_wrongs_reverse
    remove_third_wrongs
    remove_second_wrongs
    remove_first_wrongs_forward
  end
end
