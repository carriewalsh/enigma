require "./test/test_helper"

class KeyGeneratorTest < MiniTest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_random_five_digit_number_generated
    assert_equal String, @cipher.random_key.class
    assert_equal 5, @cipher.random_key.to_s.length
    assert_equal true, @cipher.random_key.to_i.between?(0,99999)
  end

  def test_keys_made_and_stored_in_hash
    @cipher.create_keys(12345)
    expected = {a: 12,
                b: 23,
                c: 34,
                d: 45}
    assert_equal expected, @cipher.keys
  end
end
