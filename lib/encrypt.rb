require "./lib/enigma"

class Encrypt
  enigma = Enigma.new
  key = ARGV[2]
  offset = ARGV[3]

  reader = File.open(ARGV[0],"r")

  message = reader.read
  reader.close

  writer = File.open(ARGV[1],"w")
  encrypted = enigma.encrypt(message.rstrip,key,offset)

  writer.write(encrypted[:encryption])
  writer.close
  puts "Created #{ARGV[1]} with the key #{enigma.key} and date #{enigma.offset}"
end
