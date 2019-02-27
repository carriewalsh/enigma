require "./test/test_helper"
require "./lib/enigma"

class LetterShiftTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
    @enigma.cipher.create_keys(12345)
    @enigma.cipher.offset_integrated("032489")
    @enigma.cipher.create_shifts
    @enigma.cipher.create_shifted_arrays(12345,"032489")
  end

  def test_string_indices_given
    assert_equal [3, 20, 2, 10, 18], @enigma.string_indices("ducks",@enigma.alphabet)
  end

  def test_all_chars_are_rotated
    assert_equal "urlci", @enigma.shift_all_forward("ducks")
  end

  def test_chars_rotated_back
    assert_equal "ducks", @enigma.shift_all_backward("urlci")
  end
end
