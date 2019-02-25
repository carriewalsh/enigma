require './test/test_helper'

class WrongsTest < MiniTest::Test
  def setup
    @cracker = Cracker.new
  end
  
  def test_can_remove_first_numbers_that_return_false
    @cracker.find_letter_align("afdsrutlgu kq")
    @cracker.calculate_shifts
    @cracker.calculate_keys(230219)
    @cracker.all_option_arrays
    @cracker.remove_first_wrongs
    assert_equal ["06","33"], @cracker.options_hash[:first]
  end

  def test_can_remove_second_numbers_that_return_false
    @cracker.find_letter_align("afdsrutlgu kq")
    @cracker.calculate_shifts
    @cracker.calculate_keys(230219)
    @cracker.all_option_arrays
    @cracker.remove_second_wrongs
    assert_equal ["39"], @cracker.options_hash[:second]
  end

  def test_can_remove_third_numbers_that_return_false
    @cracker.find_letter_align("afdsrutlgu kq")
    @cracker.calculate_shifts
    @cracker.calculate_keys(230219)
    @cracker.all_option_arrays
    @cracker.remove_third_wrongs
    assert_equal ["97"], @cracker.options_hash[:third]
  end

  def test_can_remove_fourth_numbers_that_dont_match
    @cracker.find_letter_align("afdsrutlgu kq")
    @cracker.calculate_shifts
    @cracker.calculate_keys(230219)
    @cracker.all_option_arrays
    @cracker.remove_fourth_wrongs
    assert_equal ["77"], @cracker.options_hash[:fourth]
  end
end
