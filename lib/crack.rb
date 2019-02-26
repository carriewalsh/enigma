require "./lib/offsets"
require "./lib/enigma"

class Crack
  include Offsets

  enigma = Enigma.new

  reader = File.open(ARGV[0],"r")
  encrypted = reader.read
  reader.close

  ARGV[2] != nil ? date = ARGV[2] : date = enigma.shifts.today_offset


  writer = File.open(ARGV[1],"w")
  cracked = enigma.crack(encrypted,date)

  writer.write(cracked[:decryption])
  writer.close

  puts "Created #{ARGV[0]} with the cracked key #{cracked[:key].to_s.rjust(5,"0")} and date #{ARGV[2]}"
end
