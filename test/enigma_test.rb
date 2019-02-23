require "./test/test_helper"

class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new(message: "ducks", key: "12345", offset: "032489")
    @shifts = Shifts.new
    @shifts.create_keys(@enigma.key)
    @shifts.offset_integrated(@enigma.offset)
    @shifts.create_shifts
    @enigma.add_shifts(@shifts.shifts)
    @enigma.create_shifted_arrays(@enigma.key,@enigma.offset)
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_has_message
    assert_equal "ducks", @enigma.message
  end

  def test_enigma_has_key
    assert_equal "12345", @enigma.key
  end

  def test_enigma_has_offset
    assert_equal "032489", @enigma.offset
  end

  def test_enigma_can_initialize_only_with_message
    enigma = Enigma.new(message: "ducks")
    assert_nil enigma.key
    assert_nil enigma.offset
  end

  def test_enigma_defaults_with_normal_alpha_array
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.alphabet
  end

  def test_shifts_can_be_added_to_enigma
    enigma = Enigma.new(message: "ducks")
    shifts = Shifts.new
    shifts.create_keys(12345)
    square = shifts.square_date("032489")
    four = shifts.last_four(square)
    shifts.create_offsets(four)
    shifts.create_shifts
    expected = {a: 17,
                b: 24,
                c: 36,
                d: 46}
    enigma.add_shifts(shifts.shifts)
    assert_equal expected, enigma.shifts
  end

  def test_shifts_creates_shifted_arrays
    @enigma.add_shifts(@shifts.shifts)
    @enigma.create_shifted_arrays(@enigma.key,@enigma.offset)
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
    assert_equal ["d","u","c","k","s"], @enigma.message_chars
  end

  def test_message_chars_indices_in_array
    assert_equal [3,20,2,10,18], @enigma.char_index
  end

  def test_a_chars_are_rotated
    assert_equal "uucki", @enigma.shift_a
  end

  def test_b_chars_are_rotated
    assert_equal "drcks", @enigma.shift_b
  end

  def test_c_chars_are_rotated
    assert_equal "dulks", @enigma.shift_c
  end

  def test_d_chars_are_rotated
    assert_equal "duccs", @enigma.shift_d
  end

  def test_all_chars_are_rotated
    @enigma.shift_all
    assert_equal "urlci", @enigma.message
  end

  def test_longer_message_encrypted
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

  def test_encrypt_method_creates_encrypted_message
    skip
  @enigma.encrypt(@enigma.message,@enigma.key,@engima.offset)
    assert_equal "urlci", @enigma.message
  end
end
