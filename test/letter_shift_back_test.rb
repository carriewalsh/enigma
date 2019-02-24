require "./test/test_helper"

class LetterShiftTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
    @enigma.shifts.create_keys(12345)
    @enigma.shifts.offset_integrated("032489")
    @enigma.shifts.create_shifts
    @enigma.create_shifted_arrays(12345,"032489")
    @enigma.message = "ducks" #makes it so we need attr_writer
  end

end
