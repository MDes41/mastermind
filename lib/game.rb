
class Game
  attr_reader :input, :valid_chars, :valid_length, :sequence

  def initialize
    @sequence = []
    @valid_chars = ["r", "g", "b", "y"]
    @valid_length = 4
    @counter = 0
    randomizer
  end

  def randomizer
    valid_length.times { sequence << valid_chars.shuffle.first }
  end

  def instructions
    puts "https://github.com/turingschool/curriculum/blob/master/source/projects/mastermind.markdown"
  end

  def play
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
      (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
      What's your guess?"
      destiny
  end #process color selection allow to quit game whenever allow to cheat whenever
  #validator - needs to say to short or to long & if letter is valid & valid random color pattern, needs to keep guess(loop)

  def destiny
    loop do
      print ">"
      input = gets.chomp
      @input = input.downcase
      choose_your_own_adventure
      break if input == sequence.join
    end
  end


  def choose_your_own_adventure
    case input.downcase
    when 'q', 'quit'
      quit
    when 'c', 'cheat'
      cheat #need to create a cheat method
    else
      if validator?
      puts "lets play"
      @counter += 1
       survival#create a process method that loops the letters until right answer is found.
      else
      puts "Please put in a valid response"
      end
    end
  end

  def survival
    puts "i made it"
    puts
    positions
    correct_letters
    puts "'#{input.upcase}' has #{correct_letters} of the correct elements with #{positions} in the correct positions."
    puts "You've taken 550 guess"
    #process input compare to random answer
    #keeps looking until the right answer is found.
    #counts the number of times you guessed the answer
    #returns a string with the results and asked if you want to play or quit
  end


  def positions
    input_chars = input.chars
    correct = input_chars.zip(sequence).map do |a,b|
      a == b
    end
    x = correct.count(true)
  end

  def correct_letters
    modify_sequence = sequence.dup
    # sum = 0
    # matching_letters = []
    input.chars.each do |letter|
      correct = modify_sequence.index(letter)
      if !correct.nil?
        # require "pry"
        # binding.pry
        modify_sequence.delete_at(correct)
      end
    end
    valid_length - modify_sequence.count
  end

  def validator?
    if input.length > valid_length
      puts "Too many characters"
      return false
    elsif input.length < valid_length
      puts "Not enough characters"
      return false
    elsif valid_letters?.include?(false)
      puts "Invalid input"
      # require 'pry' ; binding.pry
      return false
    end
    true
  end

  def valid_letters?
    input.chars.map do |letter|
    valid_chars.include?(letter)
    end
  end

  def cheat
    puts sequence.join
  end

  def quit
    exit
  end
end
