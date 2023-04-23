WINNING_COMBOS = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [3, 5, 7],
  [1, 5, 9]
]

combo_array = [1, 2, 5, 7]

WINNING_COMBOS.each do |n|
  # p n
  intersection = n & combo_array
  if intersection == n
    #replace line below with an action
    puts "yay"
    # end the iteration if a match is found
    break
  end

end