module Decrypter
  def decrypt_hash(decryption,key,offset)
    {decryption: decryption,
    key: key,
    date: offset}
  end

  def decrypt(encryption,key,offset)
    @shifts.create_hashes(key,offset)
    @shifts.create_shifted_arrays(key,offset)
    shift_all_back(encryption)
    decrypt_hash(encryption,key,offset)
  end
end
