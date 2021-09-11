board = ["-", "-", "-", "-", "-", "-", "-", "-", "-",]
winner = None

def GenerateBoard():
  print(f"""{board[0]}|{board[1]}|{board[2]}
{board[3]}|{board[4]}|{board[5]}
{board[6]}|{board[7]}|{board[8]}""")

def GetInput(player):
  position = int(input(f"'{player}' Turn, where would you like to place your piece (0-9): "))
  position -= 1

  run = True

  #adds piece to the board - with error checking
  while(run == True):
    if board[position] == '-':
      if player == 'O':
        board[position] = 'O' 
        run = False
      if player == 'X':
        board[position] = 'X'
        run = False
    else:
      position = int(input("Please enter a valid position, 1-9: "))
      position -= 1

def CheckWin(piece):
  global winner

  #check vertical wins
  for i in range(3):
    if board[i] == piece and board[i + 3] == piece and board[i + 6] == piece:
      winner = piece

  #check horizontal wins
  for i in range(0, 8, 4):
    if board[i] == piece and board[i + 1] == piece and board[i + 2] == piece:
      winner = piece
    
  #check diagonal wins
  if board[0] == piece and board[4] == piece and board[8] == piece:
    winner = piece

  if board[i] == piece and board[2] == piece and board[4] == piece:
    winner = piece
  
  #check tie
  for i in range(len(board)):
    if board[i] != 'X' or 'O':
      return
    elif i == 8:
      winner = 'Tie'

def MainGameLoop(isWinner):
  while isWinner == None:
    #X's turn
    GenerateBoard()
    GetInput('X')
    CheckWin('X')
    CheckWin('O')

    #O's turn
    GenerateBoard()
    GetInput('O')
    CheckWin('O')
    CheckWin('X') 

    #display who won
    if isWinner == 'Tie':
      GenerateBoard()
      print(f"It is a Tie.")
    elif isWinner == 'X' or 'O':
      GenerateBoard()
      print(f"{isWinner} is the winner.")

  playAgain = str(input("Would you like to play again y/n? "))

  if playAgain == 'y':
    isWinner = None
  elif playAgain == 'n':
    return

MainGameLoop(winner)