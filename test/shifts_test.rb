require "./test/test_helper"

class ShiftsTest < MiniTest::Test

  def setup
    @shifts = Shifts.new
  end

  def test_shifts_exist
    assert_instance_of Shifts, @shifts
  end

  def test_shifts_begins_with_skeleton_keys_hash
    expected = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    assert_equal expected, @shifts.keys
  end

  def test_shifts_begins_with_skeleton_offsets_hash
    expected = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    assert_equal expected, @shifts.offsets
  end

  def test_shifts_begins_with_skeleton_shifts_hash
    expected = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    assert_equal expected, @shifts.shifts
  end

  def test_random_five_digit_number_generated
    assert_equal String, @shifts.random_key.class
    assert_equal 5, @shifts.random_key.to_s.length
    assert_equal true, @shifts.random_key.to_i.between?(0,99999)
  end

  def test_keys_made_and_stored_in_hash
    @shifts.create_keys(12345)
    expected = {a: 12,
                b: 23,
                c: 34,
                d: 45}
    assert_equal expected, @shifts.keys
  end

  def test_makes_offset_of_todays_date
    assert_equal "220219", @shifts.today_offset
    # assert_equal Time.new.strftime("%d%m%y"), @shifts.today_offset
  end

  def test_squares_date
    assert_equal "1055535121", @shifts.square_date("032489")
  end

  def test_gets_last_four_for_offset
    square = @shifts.square_date("032489")
    assert_equal "5121", @shifts.last_four(square)
  end

  def test_offsets_made_and_stored_in_hash
    square = @shifts.square_date("032489")
    four = @shifts.last_four(square)
    @shifts.create_offsets(four)
    expected = {a: 5,
                b: 1,
                c: 2,
                d: 1}
    assert_equal expected, @shifts.offsets
  end

  def test_shifts_made_and_stored_in_hash
    @shifts.create_keys(12345)
    square = @shifts.square_date("032489")
    four = @shifts.last_four(square)
    @shifts.create_offsets(four)
    @shifts.create_shifts
    expected = {a: 17,
                b: 24,
                c: 36,
                d: 46}
    assert_equal expected, @shifts.shifts
  end
end
