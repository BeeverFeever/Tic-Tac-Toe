function PrintBoard(_board)
  println("$(_board[1])|$(_board[2])|$(_board[3])\n$(_board[4])|$(_board[5])|$(_board[6])\n$(_board[7])|$(_board[8])|$(_board[9])")
end

function GetInput(player, _board)
  print("Player $(player), select where to place your piece 1-9: ")

  @label Start
  place = readline()

  if place ∉ String["$i" for i in 1:9]
    @goto InvalidEntry
  end
  num = parse(Int, place)
  if _board[num] != '-'
    @label InvalidEntry
    print("Please select a valid place: ")
    @goto Start
  end

  _board[num] = player
  return _board
end

function CheckWin(piece, _board)
  #check vertical wins
  for i in 1:3
    if _board[i] == piece && _board[i + 3] == piece && _board[i + 6] == piece
      return piece
    end
  end

  #check horizontal wins
  for i in 1:3:7
    if _board[i] == piece && _board[i + 1] == piece && _board[i + 2] == piece
      return piece
    end
  end

  #check diagonal wins
  if _board[1] == piece && _board[5] == piece && _board[9] == piece
    return piece
  end

  if _board[3] == piece && _board[5] == piece && _board[7] == piece
    return piece
  end

  #checks for tie
  for i in 1:9
    if _board[i] == '-'
      return 'n'
    end
  end

  return 't'
end  

function MainGameLoop()
  board = ['-', '-', '-', '-', '-', '-', '-', '-', '-',]
  turn = true

  while true
    PrintBoard(board)

    turn ? player = 'X' : player = 'O'
    board = GetInput(player, board)

    check = CheckWin(player, board)

    if check != 'n'
      if check == 't'
        PrintBoard(board)
        println("The game is a Tie!")
        return
      else 
        PrintBoard(board)
        println("Play $player has won!")
        return
      end
    end
    turn = !turn
  end
end

MainGameLoop()