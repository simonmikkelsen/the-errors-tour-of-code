' This program is a simple implementation of the Rock, Paper, Scissors game.
' The purpose of this program is to demonstrate basic programming concepts in Visual Basic.
' The program will prompt the user to enter their choice of rock, paper, or scissors.
' The computer will randomly select its choice.
' The program will then determine the winner based on the rules of the game.
' The program will continue to run until the user decides to quit.

Module RockPaperScissors
    Sub Main()
        Dim userChoice As String
        Dim computerChoice As String
        Dim random As New Random()
        Dim playAgain As String = "Y"

        ' Loop to allow the user to play multiple times
        While playAgain.ToUpper() = "Y"
            ' Prompt the user to enter their choice
            Console.WriteLine("Enter your choice (rock, paper, scissors): ")
            userChoice = Console.ReadLine().ToLower()

            ' Generate the computer's choice
            Select Case random.Next(1, 4)
                Case 1
                    computerChoice = "rock"
                Case 2
                    computerChoice = "paper"
                Case 3
                    computerChoice = "scissors"
            End Select

            ' Display the choices
            Console.WriteLine("You chose: " & userChoice)
            Console.WriteLine("Computer chose: " & computerChoice)

            ' Determine the winner
            If userChoice = computerChoice Then
                Console.WriteLine("It's a tie!")
            ElseIf (userChoice = "rock" And computerChoice = "scissors") Or
                   (userChoice = "paper" And computerChoice = "rock") Or
                   (userChoice = "scissors" And computerChoice = "paper") Then
                Console.WriteLine("You win!")
            Else
                Console.WriteLine("You lose!")
            End If

            ' Ask the user if they want to play again
            Console.WriteLine("Do you want to play again? (Y/N): ")
            playAgain = Console.ReadLine()
        End While

        ' End of the program
        Console.WriteLine("Thank you for playing!")
    End Sub
End Module

