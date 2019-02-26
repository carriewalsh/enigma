module Encrypter
  def encrypt_hash(encryption,key,offset)
    {encryption: encryption,
    key: key,
    date: offset}
  end

  def encrypt(message,key,offset)
    message.downcase!
    key != nil ? key = key : key = @enigma.shifts.random_key
    offset != nil ? offset = offset : offset = enigma.shifts.today_offset
    @shifts.create_hashes(key,offset)
    @shifts.create_shifted_arrays(key,offset)
    shift_all(message)
    encrypt_hash(message,key,offset)
  end
end
