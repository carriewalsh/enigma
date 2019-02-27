require "./test/test_helper"
require "./lib/cipher"

class CipherTest < MiniTest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_cipher_exists
    assert_instance_of Cipher, @cipher
  end

  def test_cipher_begins_with_skeleton_keys_hash
    expected = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    assert_equal expected, @cipher.keys
  end

  def test_cipher_begins_with_skeleton_offsets_hash
    expected = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    assert_equal expected, @cipher.offsets
  end

  def test_cipher_begins_with_skeleton_shifts_hash
    expected = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    assert_equal expected, @cipher.shifts
  end

  def test_cipher_creates_shifts_and_stores_in_hash
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

  def test_cipher_creates_shifted_alphabet_arrays
    @cipher.create_hashes(12345,"032489")
    @cipher.create_shifted_arrays(12345,"032489")
    expected_a = ["r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q"]
    expected_b = ["y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x"]
    expected_c = ["j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i"]
    expected_d = ["t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s"]
    assert_equal expected_a, @cipher.a_array
    assert_equal expected_b, @cipher.b_array
    assert_equal expected_c, @cipher.c_array
    assert_equal expected_d, @cipher.d_array
  end

  def test_cipher_creates_all_hashes
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
