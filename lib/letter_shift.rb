module LetterShift
  def message_indices(message,array)
    if array == @alphabet
      message.chars.map {|char| @alphabet.index(char)}
    else
      message.chars.map {|char| array.index(char)}
    end
  end

  def char_reassign(string,alpha_index,string_index,array)
    if alpha_index != nil
      string[string_index] = array[alpha_index]
    end
  end

  def shift_letters(count, string, input_alphabet, output_alphabet)
    message_indices(string,input_alphabet).each_with_index do |alpha_index,string_index|
      if string_index == count
        char_reassign(string,alpha_index,string_index,output_alphabet)
        count += 4
      end
    end
  end

  def shift_all_forward(string)
    shift_letters(0, string, @alphabet, @shifts.a_array)
    shift_letters(1, string, @alphabet, @shifts.b_array)
    shift_letters(2, string, @alphabet, @shifts.c_array)
    shift_letters(3, string, @alphabet, @shifts.d_array)
    string
  end

  def shift_all_backward(string)
    shift_letters(0, string, @shifts.a_array, @alphabet)
    shift_letters(1, string, @shifts.b_array, @alphabet)
    shift_letters(2, string, @shifts.c_array, @alphabet)
    shift_letters(3, string, @shifts.d_array, @alphabet)
    string
  end
end
