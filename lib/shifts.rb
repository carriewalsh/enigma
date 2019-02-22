require "./lib/keys"

class Shifts
  include Keys
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

  def today_offset
    Time.new.strftime("%d%m%y")
  end

  def square_date(date)
    integer = date.to_i
    (integer ** 2).to_s
  end

  def last_four(square)
    square[-4,4]
  end

  def create_offsets(four)
    @offsets[:a] = four[0].to_i
    @offsets[:b] = four[1].to_i
    @offsets[:c] = four[2].to_i
    @offsets[:d] = four[3].to_i
  end

  def create_shifts
    @shifts[:a] = @keys[:a] + @offsets[:a]
    @shifts[:b] = @keys[:b] + @offsets[:b]
    @shifts[:c] = @keys[:c] + @offsets[:c]
    @shifts[:d] = @keys[:d] + @offsets[:d]
  end
end
