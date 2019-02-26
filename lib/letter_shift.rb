module LetterShift
  def char_in_alphabet(message,char,index,array)
    if char != nil
      message[index] = array[char]
    end
  end

  def shift_forward(count, message, array)
    char_index(message).each_with_index do |char,index|
      if index == count
        char_in_alphabet(message,char,index,array)
        count += 4
      end
    end
  end

  def shift_all(message)
    shift_forward(0, message, @shifts.a_array)
    shift_forward(1, message, @shifts.b_array)
    shift_forward(2, message, @shifts.c_array)
    shift_forward(3, message, @shifts.d_array)
    message
  end
end
