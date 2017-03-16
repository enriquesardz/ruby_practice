def caesar_cypher(sentence, shift_factor)
#String.ord from character to int
#Integer.chr from int to Ascii character

 encrypted_message = ""
 sentence.downcase!

 sentence.split("").each do |character|

   ascii_value = character.ord
   new_ascii_value = 0

   #97 = a ; 122 = z
   if(ascii_value >= 97 && ascii_value <= 122)
     if((ascii_value - shift_factor) < 97)
       new_ascii_value = #que empieze a restar desde 122
     end
     #encrypted_message += (ascii_value - 2).chr
   end
     encrypted_message += (ascii_value - 2).chr
 end

  puts "\nOriginal message:"
  puts "#{sentence}"
  puts "\nEncrypyted message with #{shift_factor} shift factor: "
  puts "#{encrypted_message}\n"

end

caesar_cypher("This is my test sentence, lets see how it goes", 2)
