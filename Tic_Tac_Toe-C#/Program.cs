using System;
using System.Collections.Generic;

namespace Tic_Tac_Toe
{
    class Program
    {
        static void Main(string[] args)
        {
            bool XWin = false;
            bool OWin = false;
            bool Tie = false;

            List<string> board = new List<string> {"-", "-", "-", "-", "-", "-", "-", "-", "-",};

            void generateBoard()
            {
                Console.WriteLine(board[0] + "|" + board[1] + "|" + board[2]);
                Console.WriteLine(board[3] + "|" + board[4] + "|" + board[5]);
                Console.WriteLine(board[6] + "|" + board[7] + "|" + board[8]);
            }

            void userXInput()
            {
                if(XWin || OWin || Tie) {
                    return;
                }

                Console.Write("Pick a pos for X: ");
                int i = Convert.ToInt16(Console.ReadLine());

                bool run = true;
                do{
                    if(board[i - 1] == "-"){    
                        board[i - 1] = "X";
                        run = false;
                    }else{
                        Console.Write("Please pick an empty spot: ");
                        i = Convert.ToInt16(Console.ReadLine());
                    }
                }while(run == true);
            }

            void userOInput()
            {
                if(XWin || OWin || Tie) {
                    return;
                }

                Console.Write("Pick a pos for O: ");
                int i = Convert.ToInt16(Console.ReadLine());

                bool run = true;
                do{
                    if(board[i - 1] == "-"){    
                        board[i - 1] = "O";
                        run = false;
                    }else{
                        Console.Write("Please pick an empty spot: ");
                        i = Convert.ToInt16(Console.ReadLine());
                    }
                }while(run == true);
            }

            void checkXWin() 
            {
                for (int i = 0; i < 3; i += 1)
                {
                    if(board[i] == "X" && board[i + 3] == "X" && board[i + 6] == "X") {
                    XWin = true;
                    }                    
                }

                for (int i = 0; i < 3; i += 3)
                {
                    if(board[i] == "X" && board[i + 1] == "X" && board[i + 2] == "X") {
                    XWin = true;
                    }                    
                }

                if(board[i] == "X" && board[i + 4] == "X" && board[i + 8] == "X") {
                    XWin = true;
                }   

                if(board[i] == "X" && board[i + 2] == "X" && board[i + 4] == "X") {
                    XWin = true;
                } 
            }

            void checkOWin() 
            {
                for (int i = 0; i < 3; i += 1)
                {
                    if(board[i] == "O" && board[i + 3] == "O" && board[i + 6] == "O") {
                    OWin = true;
                    }                    
                }

                for (int i = 0; i < 3; i += 3)
                {
                    if(board[i] == "O" && board[i + 1] == "O" && board[i + 2] == "O") {
                    OWin = true;
                    }                    
                }

                
                if(board[i] == "O" && board[i + 4] == "O" && board[i + 8] == "O") {
                    OWin = true;
                }   

                if(board[i] == "O" && board[i + 2] == "O" && board[i + 4] == "O") {
                    OWin = true;
                }                  
                
            }

            void checkTie()
            {
                if(!XWin && !OWin) {
                    int j = 0;
                    for (int i = 0; i < board.Count; i++)
                    {
                        if(board[i] == "X" || board[i] == "O") {
                            j++;
                            if(j == 9) {
                                Tie = true;
                            }
                        }
                    }
                }
            }

            void mainloop()
            {
                while(!XWin && !OWin && !Tie){
                    generateBoard();
                    userXInput();
                    checkOWin();
                    checkXWin();
                    checkTie();

                    generateBoard();
                    userOInput();
                    checkOWin();
                    checkXWin();
                    checkTie();
                } 

                if(Tie == true){
                    generateBoard();
                    Console.WriteLine("It is a tie!");
                }  

                if(XWin == true){
                    generateBoard();
                    Console.WriteLine("X won!");
                }

                if(OWin == true){
                    generateBoard();
                    Console.WriteLine("O won!");
                }          
            } 

            mainloop();
            Console.ReadKey();
        }
    }
}