class Player

end

class Board
  attr_reader :turns_left, :random_word

  def get_random_word(words)
    words[rand(words.length)]
  end

  def initialize(words)
    @random_word = get_random_word(words)
    @turns_left = 9
  end

  def draw_board
    puts "Word:\t#{@random_word}"
    puts "Misses:\t"
    puts "Guess:"
  end

  def miss
    @turns_left -= 1
  end

end

class Game
  words = File.readlines("5desk.txt")
  board = Board.new(words)

  while board.turns_left > 0 do
    puts board.random_word
    board.miss
  end

end

Game.new
