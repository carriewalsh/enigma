class Crack
  #include unedecided module(s)

  reader = File.open(ARGV[0],"r")
  encrypted = reader.read

  reader.close

  date = ARGV[2] #is this right?


  writer = File.open(ARGV[1],"w")
  cracked = encrypted.crack(encrypted,date)
  #my guess is this will take the date as an argument?

  writer.write(cracked)
  writer.close

end
