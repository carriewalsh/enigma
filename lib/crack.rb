require "./lib/enigma"

class Crack
  enigma = Enigma.new
  offset = ARGV[2]

  reader = File.open(ARGV[0],"r")
  encrypted = reader.read
  reader.close

  writer = File.open(ARGV[1],"w")
  cracked = enigma.crack(encrypted,offset)

  writer.write(cracked[:decryption])
  writer.close

  puts "Created #{ARGV[0]} with the cracked key #{cracked[:key].to_s.rjust(5,"0")} and date #{enigma.offset}"
end
