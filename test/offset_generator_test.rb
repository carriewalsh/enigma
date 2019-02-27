require "./test/test_helper"
require "./lib/cipher"

class OffsetGeneratorTest < MiniTest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_makes_offset_of_todays_date
    assert_equal String, @cipher.today_offset.class
    assert_equal 6, @cipher.today_offset.to_s.length
  end

  def test_squares_date
    assert_equal "1055535121", @cipher.square_date("032489")
  end

  def test_gets_last_four_for_offset
    square = @cipher.square_date("032489")
    assert_equal "5121", @cipher.last_four(square)
  end

  def test_offsets_made_and_stored_in_hash
    square = @cipher.square_date("032489")
    four = @cipher.last_four(square)
    @cipher.create_offsets(four)
    expected = {a: 5,
                b: 1,
                c: 2,
                d: 1}
    assert_equal expected, @cipher.offsets
  end

  def test_combined_methods_create_hash
    @cipher.offset_integrated("032489")
    expected = {a: 5,
      b: 1,
      c: 2,
      d: 1}
      assert_equal expected, @cipher.offsets
  end
end
