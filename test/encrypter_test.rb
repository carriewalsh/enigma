require "./test/test_helper"

class EncrypterTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_encrypt_hash_method_returns_hash
    @enigma.shifts.create_keys(12345)
    @enigma.shifts.offset_integrated("032489")
    @enigma.shifts.create_shifts
    @enigma.shifts.create_shifted_arrays(12345,"032489")
    expected = {encryption: "message",
                key: "12345",
                date: "032489"}
    assert_equal expected, @enigma.encrypt_hash("message","12345","032489")
  end

  def test_encrypt_method_creates_encrypted_message
    @enigma.shifts.create_keys(12345)
    @enigma.shifts.offset_integrated("032489")
    @enigma.shifts.create_shifts
    @enigma.shifts.create_shifted_arrays(12345,"032489")
    expected = {encryption: "urlci",
                key: "12345",
                date: "032489"}
    assert_equal expected, @enigma.encrypt("Ducks", "12345", "032489")
  end

  def test_encrypt_method_creates_encrypted_message_with_capitals
    @enigma.shifts.create_keys(12345)
    @enigma.shifts.offset_integrated("032489")
    @enigma.shifts.create_shifts
    @enigma.shifts.create_shifted_arrays(12345,"032489")
    expected = {encryption: "urlci",
                key: "12345",
                date: "032489"}
    assert_equal expected, @enigma.encrypt("DUCKS", "12345", "032489")
  end

  def test_encrypt_method_ignores_numbers_or_punctuation
    @enigma.shifts.create_keys(12345)
    @enigma.shifts.offset_integrated("032489")
    @enigma.shifts.create_shifts
    @enigma.shifts.create_shifted_arrays(12345,"032489")
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
    @enigma.encrypt("ducks2","032489")
    assert_equal Integer,@enigma.shifts.keys[:a].class
  end

  def test_if_no_date_given_uses_date_today
    @enigma.encrypt("ducks2", "12345")
    assert_equal Integer,@enigma.shifts.offsets[:a].class
    assert_equal 1,@enigma.shifts.offsets[:a].to_s.length
  end

  def test_if_no_date_or_offset_uses_random_and_today
    @enigma.encrypt("ducks2")
    assert_equal Integer,@enigma.shifts.keys[:a].class
    assert_equal Integer,@enigma.shifts.offsets[:a].class
    assert_equal 1,@enigma.shifts.offsets[:a].to_s.length
  end
end
