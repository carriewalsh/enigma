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
    @enigma.calculate_keys(230219)
    @enigma.all_option_arrays
  end

  def test_can_remove_first_numbers_that_return_false
    @enigma.remove_first_wrongs
    assert_equal ["06","33"], @enigma.options_hash[:first]
  end

  def test_can_remove_second_numbers_that_return_false
    @enigma.remove_second_wrongs
    assert_equal ["39"], @enigma.options_hash[:second]
  end

  def test_can_remove_third_numbers_that_return_false
    @enigma.remove_third_wrongs
    assert_equal ["97"], @enigma.options_hash[:third]
  end

  def test_can_remove_fourth_numbers_that_dont_match
    @enigma.remove_fourth_wrongs
    assert_equal ["77"], @enigma.options_hash[:fourth]
  end
end
