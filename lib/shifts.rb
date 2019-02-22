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
end
