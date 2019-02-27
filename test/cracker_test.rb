require "./test/test_helper"
require "./lib/enigma"

class CrackerTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
    @enigma.cipher.create_keys(12345)
    @enigma.cipher.offset_integrated("032489")
    @enigma.cipher.create_shifts
    @enigma.cipher.create_shifted_arrays(12345,"032489")
  end

  def test_counts_characters_in_encryption
    assert_equal 13, @enigma.count_chars("afdsrutlgu kq")
  end

  def test_letter_pairs_made
    expected = [[" ","u"],["e"," "],["n","k"],["d","q"]]
    assert_equal expected, @enigma.letter_pairs("afdsrutlgu kq")
  end

  def test_aligns_chars_to_shift_letters
    expected = {a: ["d","q"],
                b: [" ","u"],
                c: ["e"," "],
                d: ["n","k"]}
    @enigma.find_letter_align("afdsrutlgu kq")
    assert_equal expected, @enigma.letter_align
  end

  def test_finds_decrypted_message
    @enigma.crack("afdsrutlgu kq",nil)
    assert_equal String, @enigma.offset.class
    assert_equal 6, @enigma.offset.length
  end
end
