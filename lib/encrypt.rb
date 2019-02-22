class Encrypt
  #include undecided module(s)

reader = File.open(ARGV[0],"r")

message = reader.read
reader.close

writer = File.open(ARGV[1],"w")

encrypted = message.encrypt
#should encrypt be here or in another module?

writer.write(encrypted)
writer.close

end
