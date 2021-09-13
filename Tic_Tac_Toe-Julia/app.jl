board = ['-', '-', '-', '-', '-', '-', '-', '-', '-']

function GenerateBoard()
  println("$(board[1])|$(board[2])|$(board[3])
$(board[3])|$(board[4])|$(board[5]) 
$(board[7])|$(board[8])|$(board[9])")
end

function GetInput(player, _board)
  print("Player $(player), select where to place your piece 1-9: ")
  place = parse(Int, readline())
  if player == 'X'
    _board[place] = player
  end
  if player == 'O'
    _board[place] = player
  end

  return _board
end

function CheckWin(piece, _board)
  #check vertical wins
  for i in range(3)
    if _board[i] == piece && _board[i + 3] == piece && _board[i + 6] == piece
      winner = piece

  #check horizontal wins
  for i in range(0, 8, step = 4)
    if _board[i] == piece && _board[i + 1] == piece && _board[i + 2] == piece
      winner = piece
    
  #check diagonal wins
  if _board[0] == piece && _board[4] == piece && _board[8] == piece
    winner = piece

  if _board[i] == piece && _board[2] == piece && _board[4] == piece
    winner = piece
  
  #check tie
  for i in range(len(_board))
    if _board[i] != 'X' || 'O'
      return
    else if i == 8
      winner = "Tie"

  return winner

function Main()
  playing = true 

  while playing == true 
    GenerateBoard()
    board = GetInput('X', board)
    winner = CheckWin('X', board)
    winner = CheckWin('O', board)

    GenerateBoard()
    board = GetInput('O', board)
    winner = CheckWin('X', board)
    winner = CheckWin('O', board)
  end

  if winner == 'X' || 'O'
    prinln("$winner is the winner!")
    playing = false
  end
  if winner == "Tie"
    prinln("It is a tie")
    playing = false 
  end
end

Main()