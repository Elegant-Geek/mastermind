# coding started at 11:31PM
# finished set up of set_player names 12:15AM
# finished storing names as players with default characters. 12:58AM
# refined conditionalls for nil / blank names
# first github / git commmit at 1:55AM

module Setup
  def welcome()
    puts "Welcome to Tic-Tac Toe!"
  end
  def goodbye()
    puts "Thanks for playing!"
  end

end


class Game
  attr_reader :board, :players
  # create a list of winning combos in the array
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
  include Setup
  def initialize(game_name = "Tic Tac Toe")

    # create an array with 9 empty spaces! (before it was just @board = [] and I might revert back to that)
    @board = Array.new(9, nil)
    # p @board
    @players = []
    puts "New game called '#{game_name}' created."
  end
  def set_player_names
    2.times do |i|
      loop do
        puts "Player #{i+1}, what is your name?"
        name = gets.chomp 
          puts "Confirm name is #{name}? (Y/N)"
          # verify confirmation
          confirm_name = gets.to_s.upcase.chomp
          if (confirm_name == "Y" && (name != '' && name != nil))
            puts "Thanks! Your name is saved as '#{name}'."
            # after names set up, save them
            #create new player
            # on first iteration, assign first player to X by default.
            if i == 0
            @players << Player.new("#{name}", "X")
            # on second iteration, assign first player to X by default.
            elsif i == 1
            @players << Player.new("#{name}", "O")
            else 
              puts "something is wrong"
            end
            puts "Player #{name} saved."
            #break loop only if name is valid
            break
          elsif (confirm_name == "N")
            puts "NO? TRY AGAIN!"
          else 
            puts "Please enter Y/N. (Name cannot be left blank either). Information has not been saved."
          end
        end
    end
        ##########
        #you can comment out the display line below
        p @players
        if @players.size > 2
          p @players
          puts "Array too big (2 needed). The most recent entries have overwritten previous player data."
          # you can uncomment this line below to only grab the most recent two players in the array and reprint the array!
          # slice says start the slice at the last, and return/keep only the last two elements
          @players = @players.slice(-2, @players.length)
          p @players
        end
    ###########
  end
  def game_turn
    loop do

    puts "Starting new round with:"
    @players.each do |p|
    loop do
      puts "#{p.name} playing as #{p.character}!"
      puts "Player #{p.name} (#{p.character}), pick a position on the board using 1-9."
      selection = gets.chomp.to_i
      # add the user's selection to x or o combo array (each player has their own combo array.)
      

      p.combo_array

      # if valid selection and the space is blank on the board,
      if (selection.between?(1, 9) && @board[selection + 1].nil?)
      @board[selection - 1] = p.character
      p.combo_array << selection
      # delete duplicate entries
      p.combo_array = p.combo_array.uniq
      p @board
      break
      elsif !@board[selection + 1].nil?
        puts "Spot already taken."
      else
      # else the loop repeats til a valid character is entered
      "Type a number 1-9." 
      end
      #^ cond end
      end
      # ^ loop small end

            # sort the combo array then match it to any winning combo
            if !WINNING_COMBOS.include?(p.combo_array.sort)
              puts "here we go again!"
              end
      end
      # ^ each do end



    end
    #^^ bigger loop end

    puts "there mustve been a winner / match.."
    @players.each do |p|
    puts "#{p.combo_array}???"
    end

  end
  # ^ gameturn end




 
  def play_game()
    welcome()
    set_player_names()
    game_turn()
    # end_game()
  end
 
end

class Player
  attr_reader :name, :character
  attr_accessor :players, :combo_array
  # setting a class variable container to store all the players and their characters!
 
  def initialize(name, character)
    @name = name
    @character = character
    @combo_array = []
    #append player details to the main array of players. Each player is their own array. Maybe change this to be a hash...
  end


end

#driver code
# create defaults (comment these out these are test players)
Player.new("Player 1", "X")
Player.new("Player 2", "O")
o = Game.new("hi")
o.play_game()