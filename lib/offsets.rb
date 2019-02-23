module Offsets
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

  def offset_integrated(date)
    square = square_date(date)
    four = last_four(square)
    create_offsets(four)
  end
end
