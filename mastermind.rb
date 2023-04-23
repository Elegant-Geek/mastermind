#3:39 - 3:51pm create random code generator
# 3:51 - 4:15pm add basic custom set number of guesses!
# 4:22 - 4:33pm add basic game round loop construct
# 4:33 - 4:52pm add basic you win match, the end of game / replay / reset functions!
# 4:52 - 5:03 match all shorthand inputs to the array
# 5:03 - 5:20 BREAK TIME
# 5:20 - 6:32 finish up the conditional that helps give the user feedback on YES, wrong spot,or no

#after each guess add one to the counter
class Game
  # create a list of possible colors
  COLORS = ["Red", "Yellow", "Green", "Blue", "Purple"]

  def reset()
      # NOTE: make sure CODE instance variable below cannot be called from the console because this reveals the answer to the game! 
      # (It's curerntly hidden bc no reader/writer is given for it!)
      @code = []
      @round_guesses = []
      @round_guesses_with_feedback = []
      @guess_array = []
  end

  def initialize(game_name = "Mastermind")
    reset()
    # puts "New game called '#{game_name}' created."
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
    puts "Guess the 4 slot combination of these colors: #{COLORS})."
    puts "Feedback of 'YES' (correct color and placement), 'WP' (wrong placement), 'X' (color absent) will be given each round."
    # # comment out the two lines below (DO NOT PRINT THE SECRET CODE)
    # puts "The computer generated code is..."
    # p @code
  end

  def game_turns()
    # the guesses is hard coded to be 12 
    # (i could do a preferences option using gets.chomp.to_i to grab a number of guesses from the user (set a range like +/- 4 guesses: 8-16 guesses!))
    # then pass that variable in here instead of 12. The ^^ user pref variable is stored in setup btw.
    @guess_amount.times do |n|
      # clear the bucket that stores the last round's four guesses!
      @round_guesses = []
        # testing the guess amount! this will loop the exact amount of n times the user specifies ad then will exit the loop once n times have been reached.
        puts "Round #{n + 1}:"
        @guess_array.each do |line|
          p line
        end
        # puts "Current guesses go in this big printed array: #{@guess_array}"
        4.times do |n|
          loop do
            puts "Enter slot #{n + 1} color guess:"
            @ans = gets.chomp.capitalize
            ["R", "Y", "G", "B", "P"].each_with_index do |letter, index|
              if @ans == letter
                # match the R Y G B P index to the index of COLORS constant so that R input gets reassigned to "Red" etc
                @ans = COLORS[index]
              end
            end
            
            if !(COLORS.include?(@ans))
              puts "Invalid guess: Pick one of these colors: #{COLORS}."
            elsif (COLORS.include?(@ans))
                  # once valid entry,
            @round_guesses << @ans
            # p @round_guesses
            break
        else
          puts "something is wrong."
        end
      end
      # ^ loop end
    end
    # ^ guess amount times |n| loop end

    #after the round, dump the four guesses into big guess array for feedback:
    p @round_guesses

    ##############

    # the code below will deliver feedback on how well your guesses matched the computer's code before starting a new round!!!
    if @round_guesses == @code
      puts "YOU WIN THE GAME! The code was: #{@code}."
      # exit the @guessamount times do |n| loop and the function continues to the bottom then ends.
      break
    end
    @round_guesses_with_feedback = []
    @round_guesses.each_with_index do |color, index|
      if color == @code[index]
        # puts "#{color} in correct spot! (Correct)"
        @round_guesses_with_feedback << "#{color} (YES)"
        # color.concat(" (correct)") 
      elsif @code.include?(color)
        # puts"#{color} exists, but in wrong spot.(Close)"
        @round_guesses_with_feedback << "#{color} (WP)"
        # color.concat(" (WP)") 
      else 
        # puts "#{color} not in the code. (X)" 
        @round_guesses_with_feedback << "#{color} (X)"
        # color.concat(" (X)") 
      end
    end
    # update array with feedback before adding to big one
    @guess_array << @round_guesses_with_feedback

    ############


    end
    #^guessamount times end, replay is launched
    # the end game will give the option to relaunch another round and clear the guesses.
    replay()
  end

  def replay()
    puts "Play again? (Y/N)"
    answer = gets.to_s.upcase.chomp
    if ((answer == "Y" || answer == "YES"))
    reset()
    play_game()
    else      
      puts "Thanks for playing!"
    end
  end

  def play_game()
    create_code()
    number_of_guesses_setup()
    game_turns()
  end


end

o = Game.new()
o.play_game()



