require "./test/test_helper"

class ShiftsTest < MiniTest::Test

  def setup
    @shifts = Shifts.new
  end

  def test_shifts_exist
    assert_instance_of Shifts, @shifts
  end

  def test_shifts_begins_with_empty_keys_hash
    assert_equal ({}), @shifts.keys
  end

  def test_shifts_begins_with_empty_offsets_hash
    assert_equal ({}), @shifts.offsets
  end
  
  def test_shifts_begins_with_empty_shifts_hash
    assert_equal ({}), @shifts.shifts
  end
end
