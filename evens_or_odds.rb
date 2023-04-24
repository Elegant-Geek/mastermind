def even_odd(number)
  unless number.is_a? Numeric
    return "A number was not entered."
  end

  # puts number % 2

  if number % 2 == 0
    "That is an even number."
  else
    "That is an odd number."
  end
end

puts even_odd(20) #=>  That is an even number.
puts even_odd("Ruby") #=>  A number was not entered.

def puts_squared(number)
  puts number * number
end

def return_squared(number)
  number * number
end


puts_squared(20)
# prints 400 but will return nil implicitly (no extra line)
return_squared(20)
# returns 400 internally but prints nothing out (and no extra line)
puts puts_squared(20)
# prints 400, returns nil, then prints that nil space (extra line)
puts return_squared(20)
# prints the value of the implicit return value 400 (no extra line)
puts "done!"

def add_numbers(a, b)
  if (a.is_a?(Numeric) && b.is_a?(Numeric))
  puts "adding numbers!"
  a + b
  else 
    puts "enter two numbers please"
  end
end

add_numbers("2323", "ggf")
puts add_numbers(1, 3)

x = "IRON MAIDEN!"
x.downcase
puts x  #=> "IRON MAIDEN!"
x.downcase! 
puts x #=> "iron maiden!"

def greeting(input="hello")
  puts input
  input
end

greeting("salutations")
# prints and returns salutations
puts greeting("salutations").upcase
# runs and puts as lowercase, then will print the
# returned value of input (last line of method) as upcased
greeting()

