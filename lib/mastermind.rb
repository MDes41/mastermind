require_relative 'game'
class MasterMind

  attr_reader :game

  def initialize
    @game = Game.new
  end

  def welcome
    p "Welcome to MASTERMIND"
    puts
    p "Would you like to (p)lay,read the (i)nstructions, or (q)uit?"
    p  ">"
    input = gets.chomp
    process(input)
  end

  def process(input)
    case input.downcase
    when 'p', 'play'
      game.play
    when 'i', 'instructions'
      game.instructions
    when 'q', 'quit'
       game.quit
    else
      puts input + " undefined"
    end
  end

  #   if input == "p" || "play"
  #   puts  "play"
  #   elsif input == "i" || "instructions"
  #     puts "instructions"
  #   elsif input == "q" || "quit"
  #     puts "quit"
  #   end
  # end
end

d = MasterMind.new
d.welcome
