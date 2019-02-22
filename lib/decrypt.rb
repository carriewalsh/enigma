class Decrypt
  #include undecided module(s)

  reader = File.open(ARGV[0],"r")
  encrypted = reader.read
  reader.close

  writer = File.open(ARGV[1],"w")
  decrypted = encrypted.decrypt


  writer.write(decrypted)
  writer.close

end
