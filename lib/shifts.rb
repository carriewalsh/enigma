class Shifts
  attr_reader :keys,
              :offsets,
              :shifts
  def initialize
    @keys = {}
    @offsets = {}
    @shifts = {}
  end
end
