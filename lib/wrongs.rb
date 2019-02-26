module Wrongs
  def remove_invalid_numbers
    @options_hash.each do |letter,array|
      @options_hash[letter] = array.find_all {|option| option.length == 2}
    end
  end

  def remove_forward(upper,lower)
    num = @options_hash[upper]
    range = (0...num.length).to_a.reverse
    range.each do |number|
      if check_digit(num[number],@options_hash[lower]) == false
        @options_hash[upper].delete_at(number)
      end
    end
  end

  def remove_reverse(lower,upper)
    num = @options_hash[lower]
    range = (0...num.length).to_a.reverse
    range.each do |number|
      if check_digit_reverse(num[number],@options_hash[upper]) == false
        @options_hash[lower].delete_at(number)
      end
    end
  end

  def remove_wrongs_forward
    remove_forward(:first,:second)
    remove_forward(:second,:third)
    remove_forward(:third,:fourth)
    remove_reverse(:fourth,:third)
    remove_reverse(:third,:second)
    remove_reverse(:second,:first)
  end

  def remove_wrongs_reverse
    remove_reverse(:fourth,:third)
    remove_reverse(:third,:second)
    remove_reverse(:second,:first)
    remove_forward(:third,:fourth)
    remove_forward(:second,:third)
    remove_forward(:first,:second)
  end
end
