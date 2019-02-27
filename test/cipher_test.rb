require "./test/test_helper"

class CipherTest < MiniTest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_shifts_exist
    assert_instance_of Cipher, @cipher
  end

  def test_shifts_begins_with_skeleton_keys_hash
    expected = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    assert_equal expected, @cipher.keys
  end

  def test_shifts_begins_with_skeleton_offsets_hash
    expected = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    assert_equal expected, @cipher.offsets
  end

  def test_shifts_begins_with_skeleton_shifts_hash
    expected = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    assert_equal expected, @cipher.shifts
  end

  def test_shifts_made_and_stored_in_hash
    @cipher.create_keys(12345)
    square = @cipher.square_date("032489")
    four = @cipher.last_four(square)
    @cipher.create_offsets(four)
    @cipher.create_shifts
    expected = {a: 17,
                b: 24,
                c: 36,
                d: 46}
    assert_equal expected, @cipher.shifts
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
    @cipher.create_hashes(12345,"032489")
    assert_equal expected_keys, @cipher.keys
    assert_equal expected_offsets, @cipher.offsets
    assert_equal expected_shifts, @cipher.shifts
  end
end
