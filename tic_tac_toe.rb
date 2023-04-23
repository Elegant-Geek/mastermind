# coding started at 11:31PM
# finished set up of set_player names 12:15AM
# finished storing names as players with default characters. 12:58AM
# refined conditionalls for nil / blank names
# first github / git commmit at 1:55AM
# finish rough draft (still buggy with what counts as a win) as of 4:51AM OOPS

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
  def initialize(game_name = "Tic-Tac-Toe")
    @players = []
    reset()
    puts "New game called '#{game_name}' created."
  end
  def reset()
        # reset gameover back to false so that a new gameturn can start
        @gameover = false
        # create an array with 9 empty spaces! (before it was just @board = [] and I might revert back to that)
        @board =*(1..9)
        @players.each do |p|
          p.combo_array = []
        end
  end
  def print_default_array()
    p Array (1..3)
    p Array (4..6)
    p Array (7..9)
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
        #you can comment out the display line below
        # p @players
        if @players.size > 2
          p @players
          puts "Array too big (2 needed). The most recent entries have overwritten previous player data."
          # you can uncomment this line below to only grab the most recent two players in the array and reprint the array!
          # slice says start the slice at the last, and return/keep only the last two elements
          @players = @players.slice(-2, @players.length)
          p @players
        end
  end
  def game_turn
    while @gameover == false do
    puts "Starting new round:"
    @players.each do |p|
    loop do
      # puts "#{p.name} playing as #{p.character}!"
      puts "Player #{p.name} (#{p.character}), pick a position on the board (1-9)."
      selection = gets.chomp.to_i
      # add the user's selection to x or o combo array (each player has their own combo array.)
      p.combo_array
      # if valid selection and the space is blank on the board,
      if (selection.between?(1, 9)) && (@board[selection - 1].is_a? Numeric)
      @board[selection - 1] = p.character
      p.combo_array << selection
      # sort the combo array, delete duplicate entries, then overwrite it!
      p.combo_array = p.combo_array.sort.uniq
      # p p.combo_array
      # this line (below) must be here so that the board display gets updated every time the board changes. The map to_s includes quotes so board maintains shape throughout the game.
      @board_display = @board.map(&:to_s)
      p @board_display[0..2]
      p @board_display[3..5]
      p @board_display[6..8]
      break
      # If spot taken by x or o aka a non-numerical datatype, print this message.
      elsif (!@board[selection - 1].is_a? Numeric) && (selection <= 9)
      puts "Spot already taken."
      elsif !@board[selection - 1].nil? || selection > 9
      puts "TYPE 1-9 YOU MANIAC."
      else
      # else the loop repeats til a valid character is entered
      "Type a number 1-9." 
      end
      #^ cond end
      end
      # ^ loop small end
            # match combo array to any winning combo using iteration through every winning combo
            WINNING_COMBOS.each do |n|
              # the "and" sign catches the intersecting values of each instance of the winning combos constant and matches it to the current player's combo array.
              @intersection = n & p.combo_array
              # p.combo_array
              # p @intersection
              # if any winner at all, then report winner and break game. It doesn't matter if board is full or not. The board is checked for fullness later on.
              if  @intersection == n
                puts "PLAYER #{p.name} (#{p.character}), WINS THE GAME WITH POSITIONS #{@intersection}!"
                @gameover = true
                break
              end
            end
            #^ end winning constant each do combo loop

            # now exit out of main loop if game over is true (because it is currently nested in the each do loop above but not outside of it.)
            if @gameover == true
            break
            # now cats can be declared if board is full but the loop never broke and declared a winner as shown above!
            # cats must be checked outside of the main loop using gameover variable set to true condition because otherwise, cats will be returned on first
            # iteration if match not found but board full, so this cats must be defined based on conditions outside the each do loop! COOL!
            # if cats aka no game end and the board is full, break loop but dont 
            elsif @gameover == false && !@board.any?(1..9)
            puts "CATS! end game."
            @gameover = true
            break
            end
      end
      # ^ players each do end
    end
    #^^ bigger loop end
    puts "GAME OVER."
    # the end game will give the option to relaunch another round and clear the board, and toggle gameover back to false.
    replay()
  end
  # ^ gameturn end

  def replay()
    puts "Play again? (Y/N)"
    answer = gets.to_s.upcase.chomp
    if ((answer == "Y" || answer == "YES"))
    reset()
    print_default_array()
    game_turn()
    else      
      puts "Thanks for playing!"
    end
  end

  def play_game()
    puts "Welcome to Tic-Tac-Toe!"
    set_player_names()
    print_default_array()
    game_turn()
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
o = Game.new()
o.play_game()

# test a game with values of (1 2 3 4 5 7 6 8 9) consecutively and also try 159 for a winning combo and 1579 for the filtering system. 