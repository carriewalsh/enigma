require './test/test_helper'

class WrongsTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
    @enigma.shifts.create_keys(12345)
    @enigma.shifts.offset_integrated("032489")
    @enigma.shifts.create_shifts
    @enigma.shifts.create_shifted_arrays(12345,"032489")
    @enigma.find_letter_align("afdsrutlgu kq")
    @enigma.calculate_shifts
    @enigma.calculate_keys("230219")
    @enigma.all_option_arrays
  end

  def test_can_remove_invalid_numbers
    @enigma.remove_invalid_numbers
    expected = {:first=>["06", "33", "60", "87"],
                :second=>["12", "39", "66", "93"],
                :third=>["16", "43", "70", "97"],
                :fourth=>["23", "50", "77",]}
    assert_equal expected, @enigma.options_hash
  end

  def test_can_remove_numbers_that_return_false_forward
    @enigma.remove_forward(:first,:second)
    assert_equal ["06","33"], @enigma.options_hash[:first]
  end

  def test_can_remove_numbers_that_return_false_reverse
    @enigma.remove_reverse(:second,:first)
    assert_equal ["39", "66"], @enigma.options_hash[:second]
  end
end
