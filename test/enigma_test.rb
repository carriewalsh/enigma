require "./test/test_helper"

class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new(message: "ducks", key: "12345", offset: "032489")
    @shifts = Shifts.new
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
    @shifts.create_keys(12345)
    square = @shifts.square_date("032489")
    four = @shifts.last_four(square)
    @shifts.create_offsets(four)
    @shifts.create_shifts
    expected = {a: 17,
                b: 24,
                c: 36,
                d: 46}
    @enigma.add_shifts(@shifts.shifts)
    assert_equal expected, @enigma.shifts
  end

  def test_shifts_creates_shifted_arrays
    @shifts.create_keys(12345)
    square = @shifts.square_date("032489")
    four = @shifts.last_four(square)
    @shifts.create_offsets(four)
    @shifts.create_shifts
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
end
