test_array = [6, 5, 3, 1, 8, 7, 2, 4]
puts "Original array:"
p test_array

def bubble_sort(array)
  # if the bubble sort now matches what the sorted array outcome looks like, print it. Otherwise keep sorting!
  while array != array.sort 
    for a in 0..(array.length - 1)
      first = array[a]
      second = array[a + 1]
    #nilsafe with unless
      unless (first == nil || second == nil)
        if first > second
        array[a] = second
        array[a + 1] = first
        end
      end
    end
  end
  puts "Bubble sorted array:"
  p array
end

bubble_sort(test_array)
