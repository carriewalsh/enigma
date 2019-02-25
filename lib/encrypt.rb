require "./lib/enigma"
require "./lib/keys"
require "./lib/offsets"
require "pry"

class Encrypt
  include Keys
  include Offsets

enigma = Enigma.new
key = enigma.shifts.random_key #"12345"
offset = enigma.shifts.today_offset #"032489"

reader = File.open(ARGV[0],"r")

message = reader.read
reader.close

writer = File.open(ARGV[1],"w")
encrypted = enigma.encrypt(message.rstrip,key,offset)

writer.write(encrypted[:encryption])
writer.close
puts "Created #{ARGV[1]} with the key #{key} and date #{offset}"

end
