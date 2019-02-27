require "./test/test_helper"
require "./lib/enigma"

class DecrypterTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
    @enigma.cipher.create_keys(12345)
    @enigma.cipher.offset_integrated("032489")
    @enigma.cipher.create_shifts
    @enigma.cipher.create_shifted_arrays(12345,"032489")
  end

  def test_decrypt_hash_method_returns_hash
    expected = {decryption: "message",
                key: "12345",
                date: "032489"}
    assert_equal expected, @enigma.decrypt_hash("message","12345","032489")
  end

  def test_decrypt_method_decodes_message
    expected = {decryption: "ducks",
                key: "12345",
                date: "032489"}
    assert_equal expected, @enigma.decrypt("urlci","12345","032489")
  end
end
