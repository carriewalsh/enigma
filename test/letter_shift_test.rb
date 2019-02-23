require "./test/test_helper"

class LetterShiftTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
    @enigma.shifts.create_keys(12345)
    @enigma.shifts.offset_integrated("032489")
    @enigma.shifts.create_shifts
    @enigma.create_shifted_arrays(12345,"032489")
    @enigma.message = "ducks" #makes it so we need attr_writer
  end

  def test_a_chars_are_rotated
    assert_equal "uucki", @enigma.shift_a
  end

  def test_b_chars_are_rotated
    assert_equal "drcks", @enigma.shift_b
  end

  def test_c_chars_are_rotated
    assert_equal "dulks", @enigma.shift_c
  end

  def test_d_chars_are_rotated
    assert_equal "duccs", @enigma.shift_d
  end

  def test_all_chars_are_rotated
    @enigma.shift_all
    assert_equal "urlci", @enigma.message
  end
end
