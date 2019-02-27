module KeyGenerator
  def random_key
    rand(0..99999).to_s.rjust(5,"0")
  end

  def create_keys(input)
    string = input.to_s
    @keys[:a] = string[0,2].to_i
    @keys[:b] = string[1,2].to_i
    @keys[:c] = string[2,2].to_i
    @keys[:d] = string[3,2].to_i
  end
end
