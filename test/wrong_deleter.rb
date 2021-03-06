require './test/test_helper'
require "./lib/enigma"

class WrongDeleterTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
    @enigma.cipher.create_keys(12345)
    @enigma.cipher.offset_integrated("032489")
    @enigma.cipher.create_shifts
    @enigma.cipher.create_shifted_arrays(12345,"032489")
    @enigma.find_letter_align("afdsrutlgu kq")
    @enigma.calculate_shifts
    @enigma.calculate_keys("230219")
    @enigma.all_option_arrays
  end

  def test_can_remove_three_digit_numbers
    @enigma.remove_invalid_numbers
    expected = {:first=>["06", "33", "60", "87"],
                :second=>["12", "39", "66", "93"],
                :third=>["16", "43", "70", "97"],
                :fourth=>["23", "50", "77",]}
    assert_equal expected, @enigma.key_options_hash
  end

  def test_can_remove_wrong_keys_forward
    @enigma.remove_wrongs("forward", :first, :second)
    assert_equal ["06","33"], @enigma.key_options_hash[:first]
  end

  def test_can_remove_wrong_keys_reverse
    @enigma.remove_wrongs("reverse", :second, :first)
    assert_equal ["39", "66"], @enigma.key_options_hash[:second]
  end
end
