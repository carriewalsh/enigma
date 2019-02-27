require "./lib/letter_shift"

module Encrypter
  include LetterShift

  def encrypt(message,*args)
    if !args.include?(nil)
      @key = args[0]
      @offset = args[1]
    elsif args[0] == nil && args[1] == nil
      @key = @cipher.random_key
      @offset = @cipher.today_offset
    elsif args[0].length == 5
      @key = args[0]
      @offset = @cipher.today_offset
    elsif args[0].length == 6
      @key = @cipher.random_key
      @offset = args[0]
    end
    encrypt_integrated(message,@key,@offset)
  end

  def encrypt_hash(encryption,key,offset)
    {encryption: encryption,
      key: key,
      date: offset}
    end

  def encrypt_integrated(message,key,offset)
    message.downcase!
    @cipher.create_hashes(key,offset)
    @cipher.create_shifted_arrays(key,offset)
    shift_all_forward(message)
    encrypt_hash(message,key,offset)
  end
end
