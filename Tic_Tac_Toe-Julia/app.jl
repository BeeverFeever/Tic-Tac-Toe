board = ['-', '-', '-', '-', '-', '-', '-', '-', '-']
playing = true

function GenerateBoard()
  println("$(board[1])|$(board[2])|$(board[3])
$(board[3])|$(board[4])|$(board[5]) 
$(board[7])|$(board[8])|$(board[9])")
end

function GetInput(player = ' ')
  print("Player $(player), select where to place your piece 1-9: ")
  place = readline()
  if player == 'X'
    board[place] = player
  end
  if player == 'O'
    print("Place $place. Player $player.")
    board[place] = player
    println("test 2")
  end
end

function MainGameLoop()
  GenerateBoard()
  GetInput('O')
  GenerateBoard()
end

MainGameLoop()