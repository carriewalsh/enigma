class Shifts
  attr_reader :keys,
              :offsets,
              :shifts
  def initialize
    @keys = {a: nil,
            b: nil,
            c: nil,
            d: nil}
    @offsets = {a: nil,
            b: nil,
            c: nil,
            d: nil}
    @shifts = {a: nil,
            b: nil,
            c: nil,
            d: nil}
  end

  def random_key
    rand(0..99999).to_s.rjust(5,"0")
  end

  def create_keys(input)
    string = input.to_s
    @keys[:a] = string[0,2].to_i
    @keys[:b] = string[1,2].to_i
    @keys[:c] = string[2,2].to_i
    @keys[:d] = string[3,2].to_i

  end
end
