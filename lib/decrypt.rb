require "./lib/enigma"
require "pry"

class Decrypt
  enigma = Enigma.new

  reader = File.open(ARGV[0],"r")
  encrypted = reader.read
  reader.close

  writer = File.open(ARGV[1],"w")
  key = ARGV[2]
  offset = ARGV[3]
  decrypted = enigma.decrypt(encrypted,key,offset)


  writer.write(decrypted[:decryption])
  writer.close

  puts "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
end
