class Cracker
  attr_reader :key,:shifts, :letter_align
  def initialize
    @key = nil
    @shifts = {a: nil,
                b: nil,
                c: nil,
                d: nil}

    @letter_align = {a: [" ","u"],
                b: ["e"," "],
                c: ["n","k"],
                d: ["d","q"]}
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end

  def count_chars(message)
    message.length
  end

  def letter_pairs(message)
    [" ","e","n","d"].zip(message[-4,4].chars)
  end

  def find_letter_align(message)
    # last_four = message[-4,4]
    # case
    # when (message.length - 3) % 4 == 1
    #   @letter_align = {a: last_four[0],
    #               b: last_four[1],
    #               c: last_four[2],
    #               d: last_four[3]}
    # when (message.length - 3) % 4 == 2
    #   @letter_align = {a: last_four[3],
    #               b: last_four[0],
    #               c: last_four[1],
    #               d: last_four[2]}
    # when (message.length - 3) % 4 == 3
    #   @letter_align = {a: last_four[2],
    #               b: last_four[3],
    #               c: last_four[0],
    #               d: last_four[1]}
    #               binding.pry
    # when (message.length - 3) % 4 == 0
    #   @letter_align = {a: last_four[1],
    #               b: last_four[2],
    #               c: last_four[3],
    #               d: last_four[0]}
    # end
  end

  def calculate_shifts
    @letter_align.each do |key,letter_pair|
      diff = @alphabet.index(letter_pair[1]) - @alphabet.index(letter_pair[0])
      diff > 0 ? @shifts[key] = diff : @shifts[key] = 27 + diff
    end
  end
end
