function PrintBoard(board)
  println("$(board[1])|$(board[2])|$(board[3])
$(board[3])|$(board[4])|$(board[5]) 
$(board[7])|$(board[8])|$(board[9])")
end

function GetInput(player, _board)
  print("Player $(player), select where to place your piece 1-9: ")
  place = parse(Int, readline())
  
  run = true 

  while run
    if _board[place] == '-' && 1 < place < 9
      if player == 'X'
        _board[place] = player
        run = false 
      end
      if player == 'O'
        _board[place] = player
        run = false 
      end
    else
      println("Please select a valid place: ")
      place = parse(Int, readline())
    end
  end

  return _board
end

function CheckWin(piece, _board)
  #check vertical wins
  for i in 1:3
    if _board[i] == piece && _board[i + 3] == piece && _board[i + 6] == piece
      winner = piece
    end
  end

  #check horizontal wins
  for i in 1:3:7
    if _board[i] == piece && _board[i + 1] == piece && _board[i + 2] == piece~
      winner = piece
    end
  end

  #check diagonal wins
  if _board[1] == piece && _board[5] == piece && _board[9] == piece
    winner = piece
  end

  if _board[3] == piece && _board[5] == piece && _board[7] == piece
    winner = piece
  end

  #check tie
  for i in 1:(length(_board) - 1)
    if _board[i] != 'X' || _board[i] != 'O'
      return
    elseif i == 9
      winner = "Tie"
    end
  end

  return winner
end  

function MainGameLoop()
  board = ['-', '-', '-', '-', '-', '-', '-', '-', '-']
  playing = true 

  while playing 
    println("testing")

    PrintBoard(board[])
    board[] = GetInput('X', board[])
    winner = CheckWin('X', board[])
    winner = CheckWin('O', board[])


    println("alskdhfasdklf")
  end

  if winner == 'X' || winner == 'O'
    prinln("$winner is the winner!")
    playing = false
  end
  if winner == "Tie"
    prinln("It is a tie")
    playing = false 
  end
end

MainGameLoop()