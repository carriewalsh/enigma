require "./test/test_helper"

class LetterShiftTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
    @enigma.shifts.create_keys(12345)
    @enigma.shifts.offset_integrated("032489")
    @enigma.shifts.create_shifts
    @enigma.shifts.create_shifted_arrays(12345,"032489")
  end

  def test_all_chars_are_rotated
    assert_equal "urlci", @enigma.shift_all_forward("ducks")
  end

  def test_chars_rotated_back
    assert_equal "ducks", @enigma.shift_all_backward("urlci")

  end
end
