# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ") 
end

# Define your WIN_COMBINATIONS constant
def initialize
  @board = Array.new(9, " ")
end

WIN_COMBINATIONS = [
	[0,1,2],
	[3,4,5],
	[6,7,8],
	[0,3,6],
	[1,4,7],
	[2,5,8],
	[0,4,8],
	[6,4,2],
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
   
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    win_index_4 = win_combo[3]

    position_1 = board[win_index_1] 
    position_2 = board[win_index_2] 
    position_3 = board[win_index_3] 
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
      return win_combo
    else win_combo.all? { |win_index| win_index == "X" || win_index == "O" }
    end
  end
  return false
end

def full?(win_combo)
  win_combo.all? { |win_index| win_index == "X" || win_index == "O" }
end

def draw?(board)
  if won?(board)
    return false
  end

  if board.any? { |win_index| win_index == " " }
    return false
  end
  
  return true
end

def over?(board)
  return won?(board) || draw?(board)
end

def winner(board)
    WIN_COMBINATIONS.each do |win_combo|
      if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
        return "X"
      elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
        return "O"
      end
    end
  return nil
end
