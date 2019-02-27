require "./lib/letter_shift"

module Decrypter
  include LetterShift
  def decrypt_hash(decryption,key,offset)
    {decryption: decryption,
    key: key,
    date: offset}
  end

  def decrypt(encryption,key,offset)
    @cipher.create_hashes(key,offset)
    @cipher.create_shifted_arrays(key,offset)
    shift_all_backward(encryption)
    decrypt_hash(encryption,key,offset)
  end
end
