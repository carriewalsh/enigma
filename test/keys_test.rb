require "./test/test_helper"

class KeysTest < MiniTest::Test

  def setup
    @keys = Keys.new
  end

  def test_keys_exist
    assert_instance_of Keys, @keys
  end

  def test_keys_default_with_empty_hash
    keys = Keys.new
      assert_equal ({}), keys.keys
  end
end
