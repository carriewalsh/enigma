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
end
