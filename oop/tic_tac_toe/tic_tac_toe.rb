class Player
attr_accessor :moves, :symbol

  def initialize(symbol)
    @symbol = symbol
    @moves = []
  end

  def add_move(position)
    @moves << position
  end
end #Player class end

class Board

  def initialize()
    @table_values = (0..9).to_a
    @table_values[0] = nil
    @win_conditions = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  end

  def check_for_winner(players)
    @win_conditions.each do |win_array|
      if (win_array-players[0].moves).empty? then
        puts "Player 'x' has won!"
        return true
      end

      if (win_array-players[1].moves).empty? then
        puts "Player 'o' has won!"
        return true
      end
    end
    return false
  end

  def update_table(player_symbol,position)
    @table_values[position] = player_symbol
    draw_table
  end
  def draw_table
    puts "  \t1\t2\t3\n"

    puts "|\t#{@table_values[1]}\t#{@table_values[2]}\t#{@table_values[3]}"
    puts "|\t#{@table_values[4]}\t#{@table_values[5]}\t#{@table_values[6]}"
    puts "|\t#{@table_values[7]}\t#{@table_values[8]}\t#{@table_values[9]}"
    puts "\n\n"
  end

end #Board class end

class Game
  def initialize()
    @players = [Player.new("x"), Player.new("o")]
    start_game
  end

  def start_game
    @board = Board.new
    puts "Welcome to Tic-tac-toe"
    puts "Player 1 will be 'x' and player 2 will be 'o'"
    until (@board.check_for_winner(@players)) do
      @board.draw_table
      puts "Player 1's pick(1-9): "
      player1_pick = gets.chomp.to_i
      @players[0].add_move(player1_pick)
      @board.update_table(@players[0].symbol,player1_pick)
      puts "Player 2's pick(1-9): "
      player2_pick = gets.chomp.to_i
      @players[1].add_move(player2_pick)
      @board.update_table(@players[1].symbol,player2_pick)
    end
  end
end #Game class end

Game.new
