require "./test/test_helper"

class CrackerTest < MiniTest::Test
  def setup
    @cracker = Cracker.new
  end

  def test_cracker_exists
    assert_instance_of Cracker, @cracker
  end

  def test_cracker_starts_with_no_key
    assert_nil @cracker.key
  end

end
