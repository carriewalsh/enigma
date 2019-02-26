module Wrongs
  def remove_invalid_numbers
    @options_hash.each do |letter,array|
      @options_hash[letter] = array.find_all {|option| option.length == 2}
    end
  end

  def remove_wrongs(direction,iterated,array)
    num = @options_hash[iterated]
    range = (0...num.length).to_a.reverse
    range.each do |number|
      if check_digit(direction,num[number],@options_hash[array]) == false
        @options_hash[iterated].delete_at(number)
      end
    end
  end

  def remove_wrongs_forward
    remove_wrongs("forward", :first,:second)
    remove_wrongs("forward", :second,:third)
    remove_wrongs("forward", :third,:fourth)
    remove_wrongs("reverse", :fourth,:third)
    remove_wrongs("reverse", :third,:second)
    remove_wrongs("reverse", :second,:first)
  end

  def remove_wrongs_reverse
    remove_wrongs("reverse", :fourth,:third)
    remove_wrongs("reverse", :third,:second)
    remove_wrongs("reverse", :second,:first)
    remove_wrongs("forward", :third,:fourth)
    remove_wrongs("forward", :second,:third)
    remove_wrongs("forward", :first,:second)
  end
end
