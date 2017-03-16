def caesar_cypher(sentence, shift_factor)
#String.ord from character to int
#Integer.chr from int to Ascii character

 encrypted_message = ""

 sentence.split("").each do |character|

   ascii_value = character.ord
   new_ascii_value = 0


   #97 = a ; 122 = z
   if(ascii_value >= 97 && ascii_value <= 122)
     if((ascii_value + shift_factor) > 122)
       new_ascii_value = 96 + ascii_value + shift_factor - 122
     else
       new_ascii_value = ascii_value + shift_factor
     end
     encrypted_message += new_ascii_value.chr
     #65 = A ; 90 = Z
   elsif(ascii_value >= 65 && ascii_value <= 90)
     if((ascii_value + shift_factor) > 90)
       new_ascii_value = 64 + ascii_value + shift_factor - 90
     else
       new_ascii_value = ascii_value + shift_factor
     end
     encrypted_message += new_ascii_value.chr
   else
     encrypted_message += ascii_value.chr
   end
 end

  puts "\nOriginal message:"
  puts "#{sentence}"
  puts "\nEncrypyted message with #{shift_factor} shift factor: "
  puts "#{encrypted_message}\n"

end

caesar_cypher("This is my test sentence, lets see how it goes", 2)
caesar_cypher("I would imagine that it doesn't matter what I type, it WILL get encrypted!", 12)
