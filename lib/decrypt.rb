require "./lib/enigma"
require "pry"

class Decrypt
  #include undecided module(s)

  enigma = Enigma.new

  reader = File.open(ARGV[0],"r")
  encrypted = reader.read
  reader.close

  writer = File.open(ARGV[1],"w")
  key = ARGV[2]
  offset = ARGV[3]
  decrypted = enigma.decrypt(encrypted,key,offset)


  writer.write(decrypted)
  writer.close

end
