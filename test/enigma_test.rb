require "./test/test_helper"

class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new(message: "butts", key: "12345", offset: "032489")
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_has_message
    assert_equal "butts", @enigma.message
  end

  def test_enigma_has_key
    assert_equal "12345", @enigma.key
  end

  def test_enigma_has_offset
    assert_equal "032489", @enigma.offset
  end

  def test_enigma_can_initialize_only_with_message
    enigma = Enigma.new(message: "butts")
    assert_nil enigma.key
    assert_nil enigma.offset
  end

  def test_enigma_defaults_with_normal_alpha_array
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.alphabet
  end

  def test_shifts_creates_shifted_arrays

    expected_a =
    expected_b =
    expected_c =
    expected_d =
    assert_equal expected_a, @enigma.a_array
    assert_equal expected_b, @enigma.b_array
    assert_equal expected_c, @enigma.c_array
    assert_equal expected_d, @enigma.d_array
  end
end
