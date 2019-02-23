require "./lib/enigma"
require "./lib/keys"
require "./lib/offsets"
require "pry"

class Encrypt
  include Keys
  include Offsets

enigma = Enigma.new
key = enigma.shifts.random_key
offset = enigma.shifts.today_offset

reader = File.open(ARGV[0],"r")

message = reader.read
reader.close

writer = File.open(ARGV[1],"w")
encrypted = enigma.encrypt(message,key,offset)
#should encrypt be here or in another module?

writer.write(encrypted)
writer.close
puts "Created #{ARGV[1]} with the key #{key} and date #{offset}"

end
