#delete

module LetterShiftBack
  def char_reassign(string,alpha_index,order_index,alphabet)
    if alpha_index != nil
      string[order_index] = alphabet[alpha_index]
    end
  end


  def a_back_alpha_if(string,char,index)
    if @alphabet.include?(char)
      string[index] = @alphabet[@shifts.a_array.index(char)]
    end
  end

    def shift_back_a(encryption)
      count = 0
      encryption.chars.each_with_index do |char, index|
        if index == count
          a_back_alpha_if(encryption,char,index)
          count += 4
        end
      end
    end


    def shift_back_b(encryption)
      count = 1
      encryption.chars.each_with_index do |char, index|
        if index == count
          b_back_alpha_if(encryption,char,index)
          count += 4
        end
      end
    end

    def b_back_alpha_if(encryption,char,index)
      if @alphabet.include?(char)
        encryption[index] = @alphabet[@shifts.b_array.index(char)]
      end
    end

    def shift_back_c(encryption)
      count = 2
      encryption.chars.each_with_index do |char, index|
        if index == count
          c_back_alpha_if(encryption,char,index)
          count += 4
        end
      end
    end

    def c_back_alpha_if(encryption,char,index)
      if @alphabet.include?(char)
        encryption[index] = @alphabet[@shifts.c_array.index(char)]
      end
    end

    def shift_back_d(encryption)
      count = 3
      encryption.chars.each_with_index do |char, index|
        if index == count
          d_back_alpha_if(encryption,char,index)
          count += 4
        end
      end
    end

    def d_back_alpha_if(encryption,char,index)
      if @alphabet.include?(char)
        encryption[index] = @alphabet[@shifts.d_array.index(char)]
      end
    end

    def shift_all_back(encryption)
      shift_back_a(encryption)
      shift_back_b(encryption)
      shift_back_c(encryption)
      shift_back_d(encryption)
    end
end
