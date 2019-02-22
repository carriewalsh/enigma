require "./test/test_helper"

class EncrypterTest < MiniTest::Test
  def setup
    @encrypter = Encrypter.new("butts","12345","032489")
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
end
