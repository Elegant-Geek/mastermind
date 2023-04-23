def check_in(word)
  if word.include?("lab")
    puts word
  else 
    puts "no match"
  end
end

check_in("laboratory")
check_in("dog")
check_in("doglabdog")
