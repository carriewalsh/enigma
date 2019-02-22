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
end
