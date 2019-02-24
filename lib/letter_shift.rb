module LetterShift
  def shift_a(message)
    count = 0
    char_index(message).each_with_index do |char,index|
      if index == count
        a_alpha_if(message,char,index)
        count += 4
      end
    end
    message #can I get rid of these returns and the tests since they are in the shift_all methods?
  end

  def a_alpha_if(message,char,index)
    if char != nil
      message[index] = @a_array[char]
    end
  end

  def shift_b(message)
    count = 1
    char_index(message).each_with_index do |char,index|
      if index == count
        b_alpha_if(message,char,index)
        count += 4
      end
    end
    message
  end

  def b_alpha_if(message,char,index)
    if char != nil
      message[index] = @b_array[char]
    end
  end

  def shift_c(message)
    count = 2
    char_index(message).each_with_index do |char,index|
      if index == count
        c_alpha_if(message,char,index)
        count += 4
      end
    end
    message
  end

  def c_alpha_if(message,char,index)
    if char != nil
      message[index] = @c_array[char]
    end
  end

  def shift_d(message)
    count = 3
    char_index(message).each_with_index do |char,index|
      if index == count
        d_alpha_if(message,char,index)
        count += 4
      end
    end
    message
  end

  def d_alpha_if(message,char,index)
    if char != nil
      message[index] = @d_array[char]
    end
  end

  def shift_all(message)
    shift_a(message)
    shift_b(message)
    shift_c(message)
    shift_d(message)
  end
end
