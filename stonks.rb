stonks = [17,3,6,9,15,8,6,1,10]

def largest_hash_key(hash)
  hash.max_by{|k,v| v}
end

def stock_picker(array)
  buy_day = 0
  sell_day = 0
  size = array.length
  outcomes = Hash.new(0)
  for b in 0..(size - 1)
    buy_day = array[b]
      for s in 0..(size - 2)
        # b + s + 1 represents the array 
      sell_day = array[b + s + 1] 
      if sell_day == nil 
      else
        profit = sell_day - buy_day
        # puts "the sum is #{buy_day} + #{sell_day} = #{buy_day + sell_day}"
        # puts "subtraction test for profit calculation: #{sell_day} - #{buy_day} = #{profit}"
        # store the buy sell in the hash (NOTE: below will store the actual stock values of the buy and sell days)
        # outcomes["#{buy_day}, #{sell_day}"] = profit
        # store the buy sell in the hash (NOTE: below will store the array index numbers of the buy and sell days)
        outcomes["Buy on day #{b} and sell on day #{b + s + 1}"] = profit
      end
      end
  end
  # puts outcomes
  answer_array = largest_hash_key(outcomes)
  puts "#{answer_array[0]} for a profit of $#{answer_array[1]}!"
  puts "NOTE: The days start at 0, so the 'Day 0 stock' price for this set is $#{array[0]}."
end

stock_picker(stonks)