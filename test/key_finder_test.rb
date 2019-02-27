require "./test/test_helper"

class KeyFinderTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
    @enigma.cipher.create_keys(12345)
    @enigma.cipher.offset_integrated("032489")
    @enigma.cipher.create_shifts
    @enigma.cipher.create_shifted_arrays(12345,"032489")
  end

  def test_shifts_can_be_calculated
    @enigma.find_letter_align("afdsrutlgu kq")
    @enigma.calculate_shifts
    expected = {a: 13,
                b: 21,
                c: 22,
                d: 24}
    assert_equal expected, @enigma.cipher.shifts
  end

  def test_keys_can_be_calculated_based_on_date
    @enigma.find_letter_align("afdsrutlgu kq")
    @enigma.calculate_shifts
    expected = {a: "06",
                b: "12",
                c: "16",
                d: "23"}
    @enigma.calculate_keys("230219")
    assert_equal expected, @enigma.cipher.keys
  end

  def test_key_options_can_be_found
    @enigma.find_letter_align("afdsrutlgu kq")
    @enigma.calculate_shifts
    @enigma.calculate_keys("230219")
    @enigma.all_option_arrays
    expected = {:first=>["06", "33", "60", "87"],
                :second=>["12", "39", "66", "93"],
                :third=>["16", "43", "70", "97"],
                :fourth=>["23", "50", "77", "104"]}
    assert_equal expected, @enigma.key_options_hash
  end

  def test_can_compare_number_to_array_of_numbers
    @enigma.find_letter_align("afdsrutlgu kq")
    @enigma.calculate_shifts
    @enigma.calculate_keys("230219")
    @enigma.all_option_arrays
    actual_1 = @enigma.check_digit("forward",@enigma.key_options_hash[:first][0],@enigma.key_options_hash[:second])
    assert_equal true, actual_1
    actual_2 = @enigma.check_digit("forward",@enigma.key_options_hash[:first][2],@enigma.key_options_hash[:second])
    assert_equal false, actual_2
  end

  def test_can_compare_fourth_numbers_to_array
    @enigma.find_letter_align("afdsrutlgu kq")
    @enigma.calculate_shifts
    @enigma.calculate_keys("230219")
    @enigma.all_option_arrays
    actual = @enigma.check_digit("reverse", @enigma.key_options_hash[:fourth][2],@enigma.key_options_hash[:third])
    assert_equal true, actual
  end

  def test_finds_key_for_encrypted_message
    @enigma.find_letter_align("afdsrutlgu kq")
    @enigma.calculate_shifts
    @enigma.calculate_keys("230219")
    @enigma.all_option_arrays
    @enigma.find_key
    assert_equal "33977", @enigma.print_key
  end

  def test_finds_decrypted_message
    expected = {decryption: "olive you end",
                key: "33977",
                date: "230219"}
    assert_equal expected, @enigma.crack("afdsrutlgu kq","230219")
  end
end
