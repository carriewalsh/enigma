require "./test/test_helper"
require "./lib/enigma"

class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new
    @enigma.cipher.create_keys(12345)
    @enigma.cipher.offset_integrated("032489")
    @enigma.cipher.create_shifts
    @enigma.cipher.create_shifted_arrays(12345,"032489")
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_engima_initializes_with_cipher_object
    assert_instance_of Cipher, @enigma.cipher
  end

  def test_enigma_defaults_with_normal_alpha_array
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.alphabet
  end
end
