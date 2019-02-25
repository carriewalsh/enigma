require "./test/test_helper"

class CrackModuleTest < MiniTest::Test
  def setup
    @cracker = Cracker.new
  end

  def test_cracker_finds_key_for_encrypted_message
    @cracker.find_letter_align("afdsrutlgu kq")
    @cracker.calculate_shifts
    @cracker.calculate_keys(230219)
    @cracker.all_option_arrays
    @cracker.find_key
    assert_equal 33977, @cracker.key
  end

  def test_cracker_finds_decrypted_message
    expected = {decryption: "olive you end",
                key: "33977",
                date: "230219"}
    assert_equal expected, @cracker.crack("afdsrutlgu kq","230219")
  end
end
