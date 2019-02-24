require "./test/test_helper"

class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new
    @enigma.shifts.create_keys(12345)
    @enigma.shifts.offset_integrated("032489")
    @enigma.shifts.create_shifts
    @enigma.create_shifted_arrays(12345,"032489")
    @enigma.message = "ducks" #makes it so we need attr_writer
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_engima_initializes_with_shifts_object
    assert_instance_of Shifts, @enigma.shifts
  end

  def test_enigma_defaults_with_normal_alpha_array
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.alphabet
  end

  def test_shifts_creates_shifted_arrays
    @enigma.shifts.create_keys(12345)
    @enigma.shifts.offset_integrated("032489")
    @enigma.shifts.create_shifts
    @enigma.create_shifted_arrays(12345,"032489")
    expected_a = ["r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q"]
    expected_b = ["y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x"]
    expected_c = ["j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i"]
    expected_d = ["t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s"]
    assert_equal expected_a, @enigma.a_array
    assert_equal expected_b, @enigma.b_array
    assert_equal expected_c, @enigma.c_array
    assert_equal expected_d, @enigma.d_array
  end

  def test_message_chars_indices_in_array
    assert_equal [3,20,2,10,18], @enigma.char_index("ducks") #this requires an attr_writer...
  end

  def test_encrypt_hash_method_returns_hash
    expected = {encryption: "message",
                key: "12345",
                date: "032489"}
    assert_equal expected, @enigma.encrypt_hash("message","12345","032489")
  end

  def test_encrypt_method_creates_encrypted_message
    expected = {encryption: "urlci",
                key: "12345",
                date: "032489"}
    assert_equal expected, @enigma.encrypt("ducks", "12345", "032489")
  end

  def test_key_not_given_creates_random_number_encrypted_message
    skip
    assert_equal expected, @enigma.encrypt("ducks", "12345", "032489")
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
