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

  def test_cracker_starts_with_empty_offsets_hash
    expected = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    assert_equal expected, @cracker.offsets
  end

  def test_cracker_starts_with_empty_letter_align_hash
    expected = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    assert_equal expected, @cracker.letter_align
  end

  def test_cracker_counts_characters_in_encryption
    assert_equal 13, @cracker.count_chars("afdsrutlgu kq")
  end

  def test_cracker_aligns_chars_to_shift_letters
    expected = {a: "q",
                b: "u",
                c: " ",
                d: "k"}
    @cracker.find_letter_align("afdsrutlgu kq")
    assert_equal expected, @cracker.letter_align
  end

  def test_cracker_finds_key_for_encrypted_message
    assert_equal 33977, @cracker.crack("afdsrutlgu kq","230219")
  end

end
