class Cracker
  attr_reader :key,:offsets, :letter_align
  def initialize
    @key = nil
    @offsets = {a: nil,
                b: nil,
                c: nil,
                d: nil}

    @letter_align = {a: nil,
                b: nil,
                c: nil,
                d: nil}
  end

  def count_chars(message)
    message.length
  end

  def find_letter_align(message)
    last_four = message[-4,4]
    case
    when (message.length - 3) % 4 == 1
      @letter_align = {a: last_four[0],
                  b: last_four[1],
                  c: last_four[2],
                  d: last_four[3]}
    when (message.length - 3) % 4 == 2
      @letter_align = {a: last_four[3],
                  b: last_four[0],
                  c: last_four[1],
                  d: last_four[2]}
    when (message.length - 3) % 4 == 3
      @letter_align = {a: last_four[2],
                  b: last_four[3],
                  c: last_four[0],
                  d: last_four[1]}
                  binding.pry
    when (message.length - 3) % 4 == 0
      @letter_align = {a: last_four[1],
                  b: last_four[2],
                  c: last_four[3],
                  d: last_four[0]}
    end
  end
end
