require "./test/test_helper"
require "./lib/cipher"

class KeyGeneratorTest < MiniTest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_it_generates_a_string
    assert_equal String, @cipher.random_key.class
  end

  def test_generated_key_has_five_digits
    assert_equal 5, @cipher.random_key.length

  end

  def test_generated_key_between_zero_and_ten_thousand
    assert_equal true, @cipher.random_key.to_i.between?(0,99999)
  end

  def test_keys_created_and_stored_in_hash
    @cipher.create_keys(12345)
    expected = {a: 12,
      b: 23,
      c: 34,
      d: 45}
      assert_equal expected, @cipher.keys
    end
end
