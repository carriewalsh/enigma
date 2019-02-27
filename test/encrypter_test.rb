require "./test/test_helper"
require "./lib/enigma"

class EncrypterTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_encrypt_method_creates_encrypted_message
    @enigma.cipher.create_keys(12345)
    @enigma.cipher.offset_integrated("032489")
    @enigma.cipher.create_shifts
    @enigma.cipher.create_shifted_arrays(12345,"032489")
    expected = {encryption: "urlci",
                key: "12345",
                date: "032489"}
    assert_equal expected, @enigma.encrypt("Ducks", "12345", "032489")
  end

  def test_encrypt_method_creates_encrypted_message_with_capitals
    @enigma.cipher.create_keys(12345)
    @enigma.cipher.offset_integrated("032489")
    @enigma.cipher.create_shifts
    @enigma.cipher.create_shifted_arrays(12345,"032489")
    expected = {encryption: "urlci",
                key: "12345",
                date: "032489"}
    assert_equal expected, @enigma.encrypt("DUCKS", "12345", "032489")
  end

  def test_encrypt_method_ignores_numbers_or_punctuation
    @enigma.cipher.create_keys(12345)
    @enigma.cipher.offset_integrated("032489")
    @enigma.cipher.create_shifts
    @enigma.cipher.create_shifted_arrays(12345,"032489")
    expected = {encryption: "urlci.",
                key: "12345",
                date: "032489"}
    assert_equal expected, @enigma.encrypt("ducks.", "12345", "032489")
    expected = {encryption: "urlci2",
                key: "12345",
                date: "032489"}
    assert_equal expected, @enigma.encrypt("ducks2", "12345", "032489")
  end

  def test_if_no_key_given_uses_random_number
    @enigma.encrypt("ducks2","032489",nil)
    assert_equal String, @enigma.key.class
  end

  def test_if_no_date_given_uses_date_today
    @enigma.encrypt("ducks2", "12345", nil)
    assert_equal String, @enigma.offset.class
  end

  def test_if_no_date_or_offset_uses_random_and_today
    @enigma.encrypt("ducks2",nil,nil)
    assert_equal String, @enigma.key.class
    assert_equal String, @enigma.offset.class
  end

  def test_encrypt_hash_method_returns_hash
    @enigma.cipher.create_keys(12345)
    @enigma.cipher.offset_integrated("032489")
    @enigma.cipher.create_shifts
    @enigma.cipher.create_shifted_arrays(12345,"032489")
    expected = {encryption: "message",
    key: "12345",
    date: "032489"}
    assert_equal expected, @enigma.encrypt_hash("message","12345","032489")
  end
end
