module LetterShift
  def shift_a(message)
    count = 0
    char_index(message).each_with_index do |char,index|
      if index == count
        message[index] = @a_array[char]
        count += 4
      end
    end
    message
  end

  def shift_b(message)
    count = 1
    char_index(message).each_with_index do |char,index|
      if index == count
        message[index] = @b_array[char]
        count += 4
      end
    end
    message
  end

  def shift_c(message)
    count = 2
    char_index(message).each_with_index do |char,index|
      if index == count
        message[index] = @c_array[char]
        count += 4
      end
    end
    message
  end

  def shift_d(message)
    count = 3
    char_index(message).each_with_index do |char,index|
      if index == count
        message[index] = @d_array[char]
        count += 4
      end
    end
    message
  end

  def shift_all(message)
    shift_a(message)
    shift_b(message)
    shift_c(message)
    shift_d(message)
  end
end
