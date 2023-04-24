# puts "what is your name?"
# name = gets.capitalize.chomp
# puts "Hello, I am #{name}!"

array = [10, 20, 30, 40]
loop do
puts "how old are you?"
age = gets.chomp.to_i

if (age.class != Integer || age <= 0)
    puts "enter a valid number over 0"
  else
      array.each do |item|
        new_age = item + age
    puts "In #{item} years you will be: #{new_age}"
    end
    break
  end
end

  loop do
    puts "What is your first name?"
    first_name = gets.capitalize.chomp
    puts "What is your last name?"
    last_name = gets.capitalize.chomp
    puts "Okay, so your name is #{first_name} #{last_name}? (Y/N)"

    confirm_name = gets.to_s.upcase.chomp
    # puts confirm_name
    if (confirm_name == "Y")
      full_name = first_name + " " + last_name
      puts "Thanks! Your name is saved as '#{full_name}'."
      break
    elsif (confirm_name == "N")
      puts "NO? TRY AGAIN!"
    else 
      puts "please enter Y/N. Information has not been saved."
    end
end




