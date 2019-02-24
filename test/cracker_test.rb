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

  def test_cracker_starts_with_empty_shifts_hash
    expected = {a: nil,
                b: nil,
                c: nil,
                d: nil}
    assert_equal expected, @cracker.shifts
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

  def test_letter_pairs_made
    expected = [[" ","u"],["e"," "],["n","k"],["d","q"]]
    assert_equal expected, @cracker.letter_pairs("afdsrutlgu kq")
  end

  def test_cracker_aligns_chars_to_shift_letters
    expected = {a: ["d","q"],
                b: [" ","u"],
                c: ["e"," "],
                d: ["n","k"]}
    @cracker.find_letter_align("afdsrutlgu kq")
    assert_equal expected, @cracker.letter_align
  end

  def test_shifts_can_be_calculated
    @cracker.find_letter_align("afdsrutlgu kq")
    @cracker.calculate_shifts
    expected = {a: 13,
                b: 21,
                c: 22,
                d: 24}
    assert_equal expected, @cracker.shifts
  end

  def test_keys_can_be_calculated_based_on_date
    @cracker.find_letter_align("afdsrutlgu kq")
    @cracker.calculate_shifts
    expected = {a: "06",
                b: "12",
                c: "16",
                d: "23"}
    @cracker.calculate_keys(230219)
    assert_equal expected, @cracker.keys
  end

  def test_cracker_finds_key_for_encrypted_message
    @cracker.find_letter_align("afdsrutlgu kq")
    @cracker.calculate_shifts
    @cracker.calculate_keys(230219)
    @cracker.find_key
    assert_equal 33977, @cracker.key
  end

  def test_cracker_finds_decrypted_message
    assert_equal "olive you end", @cracker.crack("afdsrutlgu kq","230219")
  end

end
