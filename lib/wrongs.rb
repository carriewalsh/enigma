module Wrongs
  def remove_first_wrongs
    [3,2,1,0].each do |number|
      if number != nil
        if check_digit(@options_hash[:first][number],@options_hash[:second]) == false
          @options_hash[:first].delete_at(number)
        end
      end
    end
  end

  def remove_second_wrongs
    [3,2,1,0].each do |number|
      if check_digit(@options_hash[:second][number],@options_hash[:third]) == false
        @options_hash[:second].delete_at(number)
      end
    end
  end

  def remove_third_wrongs
    [3,2,1,0].each do |number|
      if check_digit(@options_hash[:third][number],@options_hash[:fourth]) == false
        @options_hash[:third].delete_at(number)
      end
    end
  end

  def remove_fourth_wrongs
    [3,2,1,0].each do |number|
      if check_digit(@options_hash[:fourth][number].reverse,@options_hash[:third].reverse) == false
        @options_hash[:fourth].delete_at(number)
      end
    end
  end
end
