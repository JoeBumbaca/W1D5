require_relative "00_tree_node"

class KnightPathFinder

  def self.valid_moves(pos)
    valid_moves = []
    move_distances = [[1,2],[1,-2], [-1,2], [-1,-2], [2,1], [2, -1], [-2, 1], [-2, -1]]

    while valid_moves.length < 8
      move = move_distances.shift
      valid_move = [(pos[0] + move[0]), (pos[1] + move[1])]
      valid_moves << valid_move
    end

    valid_moves.select! { |move| (move[0] <= 7 && move[1] <= 7) && (move[0] >= 0 && move[1] >= 0) }
    valid_moves
  end

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    # @move_tree = build_move_tree(@root_node)
    @considered_positions = [pos]
  end

  def new_move_positions(pos)
    v_moves = valid_moves(pos)
    v_moves.reject! { |move| @considered_positions.include?(move) }
    v_moves.each { |move| @considered_positions << move }
    v_moves
  end

  # def build_move_tree

  # end
end

# knight = KnightPathFinder.new([0,0])
 p KnightPathFinder.valid_moves([7,7])
