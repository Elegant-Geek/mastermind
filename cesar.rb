abc_array = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
# test array works
# p abc_array

def grab_value(array_name, letter)
 array_name.index(letter.downcase) + 1
end
# test that grabber works: a is 1, b is 2, c is 3, d is 4. (HINT: put "p" aka print on line 6: p array_name.index(letter.downcase) + 1)
# grab_value(abc_array, "a")
# grab_value(abc_array, "b")
# grab_value(abc_array, "c")
# grab_value(abc_array, "d")

def shift(letter_index, value)
  # add the shift value forward so that z can become a for instance
  letter_index += value 
  # for numbers greater than 26, the remainder shows
  # NOTE: this command below is all encompassing for both positive and negative numbers because:
  # example of the math: -43 % 26 (9) is not the same as 43 % 26 (17). 
  # W becomes F in a shift of -43. In the division, if you were to manually subtract out all 26,
  # you would get -43 + 26 = -17 which is f. Turns out that in the calculation -43 % 26 (9),
  # 9 jumps forward is equivalent to 17 steps back when dividing by 26! Very cool. 
  # The % calculation always returns a positive remainder! 
    letter_index = letter_index % 26
   # removed p in front of the line below to clear console a bit

end

# test the shift
# shift(2, 5)
# shift(25, 2)
# shift(26, 2)
# shift(10, 20)

# this function spits out the new index given the shift parameter as input
# if the new value greater than 26, then take the value and make new index value: value-26 or remainder of it value % 26

def convert_to_letter(array_name, number)
  if number <= 26
    # removed p in front of the line below to clear console a bit
    array_name[number-1]
  else
    p "something is wrong"
  end
end

#test the conversion function (use puts in front when testing this line)
# convert_to_letter(abc_array, 26)

# test_string = "test String"
test_string = "What a string!"
def split_join_rearange(string, shift_value)
  puts "'#{string}' was transformed into..."
  abc_array = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  # for each thing, substitute the old character with the new without anything else
  string.split("").map do |item|
  # if item is a valid abc then substitute it
  if item =~ /[a-zA-Z]/
    # puts "#{item} is valid."
    #running through all my functions before!
    old_index = grab_value(abc_array, item)
    new_index = shift(old_index, shift_value)
    new_letter = convert_to_letter(abc_array, new_index)
    # If the individual letter was originally upcased and was set to downcase in this function, set it back to upcase. Otherwise ignore it.
    # NOTE: bang operator broke shift values of 5 10 and 11 so it was replaced with "new_letter = new_letter.upcase" which caused no issues.
    if item == item.upcase
      new_letter = new_letter.upcase
    end
    # replace the string character!
    string = string.gsub(item, new_letter)
    # the puts below is a good check as you go
    # puts string.upcase()
  else
    # puts "invalid/unaffected character like a space or !"
  end
end
# print final result one time
p string
end

# breaks for 5 10 and 11 for shift step if bang operator is used in line 67 (new_letter.upcase! << BAD)
split_join_rearange(test_string, -43)

# for n in -100..100
#   #Quick easy way of testing the shift value from 0 (no shift) to 100 :D NO ERRORS!
#   puts "iteration #{n}"
#   split_join_rearange(test_string, n)
# end