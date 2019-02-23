module LetterShift
  def shift_a
    count = 0
    char_index.each_with_index do |char,index|
      if index == count
        @message[index] = @a_array[char]
        count += 4
      end
    end
    @message
  end

  def shift_b
    count = 1
    char_index.each_with_index do |char,index|
      if index == count
        @message[index] = @b_array[char]
        count += 4
      end
    end
    @message
  end

  def shift_c
    count = 2
    char_index.each_with_index do |char,index|
      if index == count
        @message[index] = @c_array[char]
        count += 4
      end
    end
    @message
  end

  def shift_d
    count = 3
    char_index.each_with_index do |char,index|
      if index == count
        @message[index] = @d_array[char]
        count += 4
      end
    end
    @message
  end

  def shift_all
    shift_a
    shift_b
    shift_c
    shift_d
  end
end
