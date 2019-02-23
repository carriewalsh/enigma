require "./test/test_helper"

class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new
    # @shifts.create_keys(@enigma.key)
    # @shifts.offset_integrated(@enigma.offset)
    # @shifts.create_shifts
    # @enigma.create_shifted_arrays(@enigma.key,@enigma.offset)
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

  def test_message_turned_into_array
    skip
    assert_equal ["d","u","c","k","s"], @enigma.message_chars
  end

  def test_message_chars_indices_in_array
    skip
    assert_equal [3,20,2,10,18], @enigma.char_index
  end

  def test_a_chars_are_rotated
    skip
    assert_equal "uucki", @enigma.shift_a
  end

  def test_b_chars_are_rotated
    skip
    assert_equal "drcks", @enigma.shift_b
  end

  def test_c_chars_are_rotated
    skip
    assert_equal "dulks", @enigma.shift_c
  end

  def test_d_chars_are_rotated
    skip
    assert_equal "duccs", @enigma.shift_d
  end

  def test_all_chars_are_rotated
    skip
    @enigma.shift_all
    assert_equal "urlci", @enigma.message
  end

  def test_longer_message_encrypted
    skip
    enigma = Enigma.new(message: "we didnt start the fire", key: "12345", offset: "032489")
    shifts = Shifts.new
    shifts.create_keys(12345)
    square = shifts.square_date("032489")
    four = shifts.last_four(square)
    shifts.create_offsets(four)
    shifts.create_shifts
    enigma.add_shifts(shifts.shifts)
    enigma.create_shifted_arrays(enigma.key,enigma.offset)
    enigma.shift_all
    expected = "mbiwzawlqpbthqilybiyzon"
    assert_equal expected, enigma.message
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
end
