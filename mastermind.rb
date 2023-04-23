#3:39 - 3:51pm create random code generator
# 3:51-4:15 add basic custom set number of guesses!

#after each guess add one to the counter
class Game
  attr_reader :board, :players
  # create a list of possible colors
  COLORS = ["R", "Y", "G", "B", "P"]

  def initialize(game_name = "Mastermind")
    @players = []
    # NOTE: make sure CODE instance variable below cannot be called from the console because this reveals the answer to the game! 
    # (It's curerntly hidden bc no reader/writer is given for it!)
    @code = []
    # reset()
    puts "New game called '#{game_name}' created."
  end

  def number_of_guesses_setup()
    loop do
      puts "How many guesses do you want? (8-16 allowed)"
      @guess_amount = gets.chomp.to_i
      if !(@guess_amount.between?(8, 16))
        puts "Invalid answer: A range of 8-16 guesses is allowed."
      elsif (@guess_amount.between?(8, 16))
            # once valid entry,
      puts "Ok, you have #{@guess_amount} guesses. Good luck!"
      break
      else
        puts "something is wrong."
      end
    end
  end

  def create_code()
    4.times do 
      @code << COLORS[rand(0..4)]
    end
    puts "The computer has generated a color combo (4 slots and colors of #{COLORS})."
    # comment out the two lines below (DO NOT PRINT THE SECRET CODE)
    puts "The computer generated code is..."
    p @code
  end

  def game_turn()
    # the guesses is hard coded to be 12 
    # (i could do a preferences option using gets.chomp.to_i to grab a number of guesses from the user (set a range like +/- 4 guesses: 8-16 guesses!))
    # then pass that variable in here instead of 12. The ^^ user pref variable is stored in setup btw.
    @guess_amount.times do |n|
      # testing the guess amount! this will loop the exact amount of n times the user specifies ad then will exit the loop once n times have been reached.
      puts "Round #{n + 1}:"
    end
  end

  def play_game()
    create_code()
    number_of_guesses_setup()
    game_turn()
  end


end

o = Game.new()
o.play_game()



