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

  def test_shifts_integrated_method_creates_all_hashes
    expected_keys = {:a=>12,
                :b=>23,
                :c=>34,
                :d=>45}
    expected_offsets = {:a=>5,
                :b=>1,
                :c=>2,
                :d=>1}
    expected_shifts = {:a=>17,
                :b=>24,
                :c=>36,
                :d=>46}
    @shifts.create_hashes(12345,"032489")
    assert_equal expected_keys, @shifts.keys
    assert_equal expected_offsets, @shifts.offsets
    assert_equal expected_shifts, @shifts.shifts
  end
end
