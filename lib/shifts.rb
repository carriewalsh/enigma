require "./lib/keys"
require "./lib/offsets"

module Shifts
  include Keys
  include Offsets

    def create_shifts
      @shifts[:a] = @keys[:a] + @offsets[:a]
      @shifts[:b] = @keys[:b] + @offsets[:b]
      @shifts[:c] = @keys[:c] + @offsets[:c]
      @shifts[:d] = @keys[:d] + @offsets[:d]
    end
end
