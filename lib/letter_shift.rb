module LetterShift
  def string_indices(string,array)
    if array == @alphabet
      string.chars.map {|char| @alphabet.index(char)}
    else
      string.chars.map {|char| array.index(char)}
    end
  end

  def char_reassign(string,alpha_index,string_index,array)
    if alpha_index != nil
      string[string_index] = array[alpha_index]
    end
  end

  def shift_letters(count, string, input_alphabet, output_alphabet)
    string_indices(string,input_alphabet).each_with_index do |alpha_index,string_index|
      if string_index == count
        char_reassign(string,alpha_index,string_index,output_alphabet)
        count += 4
      end
    end
  end

  def shift_all_forward(string)
    shift_letters(0, string, @alphabet, @cipher.a_array)
    shift_letters(1, string, @alphabet, @cipher.b_array)
    shift_letters(2, string, @alphabet, @cipher.c_array)
    shift_letters(3, string, @alphabet, @cipher.d_array)
    string
  end

  def shift_all_backward(string)
    shift_letters(0, string, @cipher.a_array, @alphabet)
    shift_letters(1, string, @cipher.b_array, @alphabet)
    shift_letters(2, string, @cipher.c_array, @alphabet)
    shift_letters(3, string, @cipher.d_array, @alphabet)
    string
  end
end
