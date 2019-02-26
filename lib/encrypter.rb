require "./lib/letter_shift"

module Encrypter
  include LetterShift
  def encrypt_hash(encryption,key,offset)
    {encryption: encryption,
    key: key,
    date: offset}
  end

  def encrypt(message,*args)
    if args.count == 2
      key = args[0]
      offset = args[1]
    elsif args.count == 0
      key = @shifts.random_key
      offset = @shifts.today_offset
    elsif args[0].length == 5
      key = args[0]
      offset = @shifts.today_offset
    elsif args[0].length == 6
      offset = args[0]
      key = @shifts.random_key
    end
    encrypt_integrated(message,key,offset)
  end

  def encrypt_integrated(message,key,offset)
    message.downcase!
    @shifts.create_hashes(key,offset)
    @shifts.create_shifted_arrays(key,offset)
    shift_all(message)
    encrypt_hash(message,key,offset)
  end
end
