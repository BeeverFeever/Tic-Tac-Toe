#include <stdlib.h>
#include <stdio.h>

void PrintBoard(char _board[])
{
  printf("%c|%c|%c\n-+-+-\n%c|%c|%c\n-+-+-\n%c|%c|%c\n", _board[0], _board[1], _board[2], _board[3], _board[4], _board[5], _board[6], _board[7], _board[8]);
} 

void PlacePiece(char _playerTurn, char _board[])
{
  int _playerChoice;
  int run = 1;

  printf("Pick a spot to place a %c (1-9): ", _playerTurn);
  scanf("%d", &_playerChoice);

  while (run == 1) {
    if (_board[_playerChoice - 1] == ' ') {
      _board[_playerChoice - 1] = _playerTurn;
      run = 0;
    } else {
      printf("Please select an empty square: ");
      scanf("%d", &_playerChoice);
    }
  }
}

int CheckWin(char _board[], char _player)
{
  int i, x;

  // Vertical checks
  for (i = 0; i < 3; i++) {
    if (_board[i] == _player, _board[i + 3] == _player, _board[i + 6] == _player) {
      return 1;
    }
  }

  // Horizontal checks
  for (i = 0; i < 7; i += 3) {
    if (_board[i] == _player, _board[i + 1] == _player, _board[i + 2] == _player) {
      return 1;
    }
  }

  // Diagonal checks
  if (_board[0] == _player && _board[4] == _player && _board[8] == _player) {
    return 1;
  }

  if (_board[2] == _player && _board[4] == _player && _board[6] == _player) {
    return 1;
  }

  // Check tie
  for (i = 0; i < sizeof(_board); i++) {
    if (_board[i] == ' ') {
      return 0;
    } else if (i == 8) {
      return 2;
    }
  }
}

int main()
{
  char board[] = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '};
  char player;
  int playing = 1;
  int winner;

  while(playing == 1)
  {
    player = 'X';
    PrintBoard(board);
    PlacePiece(player, board);
    winner = CheckWin(board, player);
    if (winner == 0) {
     playing = 1;
    } else {
      playing = 0; 
    }

    player = 'O';
    PrintBoard(board);
    PlacePiece(player, board);
    winner = CheckWin(board, player);
    if (winner == 0) {
      playing = 1;
    } else {
      playing = 0; 
    } 

    if (winner == 2) {
      PrintBoard(board);
      printf("The game was a tie!");
      return 0;
    } else if (winner == 1) {
      PrintBoard(board);
      printf("The winner is the %c player!", player);
      return 0;
    }
  }
}
