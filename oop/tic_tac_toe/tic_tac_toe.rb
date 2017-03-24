class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Board
  @table_values = ["."]["."]
  def initialize(first_player, second_player)
    @first_player = Player.new(first_player)
    @second_player = Player.new(second_player)
  end

  def draw_table
    puts "  \t1\t2\t3"
    puts "1|\to\to\to"
    puts "2|\to\to\to"
    puts "3|\to\to\to"
  end
end

board = Board.new("Q", "W")
board.draw_table
