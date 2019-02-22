require "./test/test_helper"

class EncrypterTest < MiniTest::Test
  def setup
    @encrypter = Encrypter.new(message: "butts", key: "12345", offset: "032489")
  end

  def test_encrypter_exists
    assert_instance_of Encrypter, @encrypter
  end

  
end
