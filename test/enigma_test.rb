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
end
