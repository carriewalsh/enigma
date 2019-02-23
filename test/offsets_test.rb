require "./test/test_helper"

class OffsetsTest < MiniTest::Test

  def setup
    @shifts = Shifts.new
  end

  def test_makes_offset_of_todays_date
    assert_equal "230219", @shifts.today_offset
    # assert_equal Time.new.strftime("%d%m%y"), @shifts.today_offset
  end

  def test_squares_date
    assert_equal "1055535121", @shifts.square_date("032489")
  end

  def test_gets_last_four_for_offset
    square = @shifts.square_date("032489")
    assert_equal "5121", @shifts.last_four(square)
  end

  def test_offsets_made_and_stored_in_hash
    square = @shifts.square_date("032489")
    four = @shifts.last_four(square)
    @shifts.create_offsets(four)
    expected = {a: 5,
                b: 1,
                c: 2,
                d: 1}
    assert_equal expected, @shifts.offsets
  end
end
