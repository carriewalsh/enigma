require "./test/test_helper"

class EncrypterTest < MiniTest::Test
  def setup
    @encrypter = Encrypter.new(message: "butts", key: "12345", offset: "032489")
  end

  def test_encrypter_exists
    assert_instance_of Encrypter, @encrypter
  end

  def test_encrypter_has_message
    assert_equal "butts", @encrypter.message
  end

  def test_encrypter_has_key
    assert_equal "12345", @encrypter.key
  end

  def test_encrypter_has_offset
    assert_equal "032489", @encrypter.offset
  end

  def test_encrypter_can_initialize_only_with_message
    encrypter = Encrypter.new(message: "butts")
    assert_equal nil, encrypter.key
    assert_equal nil, encrypter.offset
  end
end
