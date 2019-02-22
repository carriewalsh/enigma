require "./test/test_helper"

class ShiftsTest < MiniTest::Test

  def setup
    @shifts = Shifts.new
  end

  def test_shifts_exist
    assert_instance_of Shifts, @shifts
  end
end
