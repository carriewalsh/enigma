require "./test/test_helper"

class ShiftsTest < MiniTest::Test

  def setup
    @shifts = Shifts.new
  end

  def test_shifts_exist
    assert_instance_of Shifts, @shifts
  end

  # def test_shifts_beings_with_empty_hash
  #   assert_equal ({}), @shifts.shifts
  # end
end
