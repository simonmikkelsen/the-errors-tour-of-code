' This program is a simple implementation of the Rock, Paper, Scissors game in Visual Basic .NET.
' The purpose of this program is to provide a basic example of how to implement a console-based game.
' The program will prompt the user to enter their choice, generate a random choice for the computer,
' and then determine the winner based on the standard rules of Rock, Paper, Scissors.
' The program will also display the results of each round and keep track of the score.

Imports System

Module RockPaperScissors
    Sub Main()
        ' Declare variables to store user and computer choices
        Dim userChoice As String
        Dim computerChoice As String
        Dim random As New Random()
        Dim playAgain As String = "Y"

        ' Loop to allow multiple rounds of the game
        While playAgain.ToUpper() = "Y"
            ' Prompt the user to enter their choice
            Console.WriteLine("Enter your choice (Rock, Paper, Scissors): ")
            userChoice = Console.ReadLine().ToUpper()

            ' Generate a random choice for the computer
            Select Case random.Next(1, 4)
                Case 1
                    computerChoice = "ROCK"
                Case 2
                    computerChoice = "PAPER"
                Case 3
                    computerChoice = "SCISSORS"
            End Select

            ' Display the choices
            Console.WriteLine("You chose: " & userChoice)
            Console.WriteLine("Computer chose: " & computerChoice)

            ' Determine the winner
            If userChoice = computerChoice Then
                Console.WriteLine("It's a tie!")
            ElseIf (userChoice = "ROCK" And computerChoice = "SCISSORS") Or
                   (userChoice = "PAPER" And computerChoice = "ROCK") Or
                   (userChoice = "SCISSORS" And computerChoice = "PAPER") Then
                Console.WriteLine("You win!")
            Else
                Console.WriteLine("Computer wins!")
            End If

            ' Ask the user if they want to play again
            Console.WriteLine("Do you want to play again? (Y/N): ")
            playAgain = Console.ReadLine().ToUpper()
        End While

        ' Close the program
        Console.WriteLine("Thanks for playing!")
    End Sub
End Module