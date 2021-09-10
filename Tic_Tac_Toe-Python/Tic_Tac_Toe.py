board = ["-", "-", "-", "-", "-", "-", "-", "-", "-",]
winner = None

def GenerateBoard():
  print(f"""{board[0]}|{board[1]}|{board[2]}
{board[3]}|{board[4]}|{board[5]}
{board[6]}|{board[7]}|{board[8]}""")

# def XInput():
#   position = int(input("'X' Turn, where would you like to place your piece (0-9): "))
#   ++position

#   run = True

#   while(run):
#     if board[position] == '-':
#       board[position] = 'X' 
#       run = False
#     else:
#       position = int(input("Please enter a valid position, 1-9: "))
#       ++position

# def XInput():
#   position = int(input("'O' Turn, where would you like to place your piece (0-9): "))
#   ++position

#   run = True

#   while(run):
#     if board[position] == '-':
#       board[position] = 'O' 
#       run = False
#     else:
#       position = int(input("Please enter a valid position, 1-9: "))
#       ++position

def GetInput(player):
  position = int(input(f"'{player}' Turn, where would you like to place your piece (0-9): "))
  ++position

  run = True

  while(run):
    if board[position] == '-':
      if player == 'O':
        board[position] = 'O' 
        run = False
      if player == 'X':
        board[position] = 'X'
        run = False
    else:
      position = int(input("Please enter a valid position, 1-9: "))
      ++position

def CheckWin(piece):
  for i in range(3):
    if board[i] == piece & board[i + 3] == piece & board[i + 6] == piece:
      winner = piece

  j = 1
  for i in range(3):
    if board[j] == piece & board[j + 1] == piece & board[j + 2] == piece:
      winner = piece
    j += 3

  k = 1
  for i in range(2):
    if board[k] == piece & board[k + 4] == piece & board[k + 8] == piece:
      winner = piece
    k += 3

  for i in range(board.count()):
    if board[i] != 'X' | 'O':
      return
    elif i == 9:
      winner = 'Tie'

def MainGameLoop():
  while winner != None:
    GenerateBoard()
    GetInput()
    CheckWin()

    GenerateBoard()
    GetInput()
    CheckWin()

  if winner == 'Tie':
    GenerateBoard()
    print(f"It is a Tie.")
  else:
    GenerateBoard()
    print(f"{winner} is the winner.")

MainGameLoop()