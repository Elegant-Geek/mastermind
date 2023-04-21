# coding started at 11:31PM
# finished set up of set_player names 12:15AM
# finished storing names as players with default characters. 12:58AM
# refined conditionalls for nil / blank names
module Setup
  def welcome()
    puts "Welcome to Tic-Tac Toe!"
  end
  def goodbye()
    puts "Thanks for playing!"
  end

end


class Game
  include Setup
  def initialize(game_name = "Tic Tac Toe")
    @board = []
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
            Player.new("#{name}", "X")
            # on second iteration, assign first player to X by default.
            elsif i == 1
            Player.new("#{name}", "O")
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
  end
  def game_turns
    @@players.each do |p|
      p.shout()
    end


  end
  def play_game()
    welcome()
    set_player_names()
    # game_turns()
    # end_game()
  end
 
end

class Player
  attr_reader :name, :character
  attr_accessor :players
  # setting a class variable container to store all the players and their characters!
  @@players = []
  def initialize(name, character)
    @name = name
    @character = character
    #append player details to the main array of players. Each player is their own array. Maybe change this to be a hash...
    @@players << [@name, @character]
    #you can comment out the display line below
    p @@players
    if @@players.size > 2
      p @@players
      puts "Array too big (2 needed). The most recent entries have overwritten previous player data."
      # you can uncomment this line below to only grab the most recent two players in the array and reprint the array!
      # slice says start the slice at the last, and return/keep only the last two elements
      @@players = @@players.slice(-2, @@players.length)
      p @@players
    end
  end
  def shout()
    puts "#{@name} with character #{@character}!!!!!"
  end

end

#driver code
# create defaults (comment these out these are test players)
# Player.new("Player 1", "X")
# Player.new("Player 2", "O")
o = Game.new("hi")
o.play_game()