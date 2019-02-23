require "./lib/enigma"

class Decrypt
  #include undecided module(s)

  enigma = Enigma.new

  reader = File.open(ARGV[0],"r")
  encrypted = reader.read
  reader.close

  writer = File.open(ARGV[1],"w")
  decrypted = enigma.decrypt(encrypted,)


  writer.write(decrypted)
  writer.close

end
