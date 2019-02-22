require "./test/test_helper"

class ShiftsTest < MiniTest::Test

  def setup
    @shifts = Shifts.new
  end

  def test_shifts_exist
    assert_instance_of Shifts, @shifts
  end

  def test_shifts_begins_with_skeleton_keys_hash
    assert_equal ({a: nil,
                    b: nil,
                    c: nil,
                    d: nil}), @shifts.keys
  end

  def test_shifts_begins_with_skeleton_offsets_hash
    assert_equal ({a: nil,
                    b: nil,
                    c: nil,
                    d: nil}), @shifts.offsets
  end

  def test_shifts_begins_with_skeleton_shifts_hash
    assert_equal ({a: nil,
                    b: nil,
                    c: nil,
                    d: nil}), @shifts.shifts
  end

  def test_random_five_digit_number_generated
    assert_equal String, @shifts.random_key.class
    assert_equal 5, @shifts.random_key.to_s.length
    assert_equal true, @shifts.random_key.to_i.between?(0,99999)
  end
end
