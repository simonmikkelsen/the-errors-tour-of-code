' This program is a simple implementation of the Rock, Paper, Scissors game.
' The purpose of this program is to provide a basic example of how to use
' conditional statements and loops in Visual Basic. The program allows the
' user to play multiple rounds of Rock, Paper, Scissors against the computer.

Module RockPaperScissors
    Sub Main()
        ' Declare variables to store user and computer choices
        Dim userChoice As String
        Dim computerChoice As String
        Dim random As New Random()

        ' Loop to allow multiple rounds of the game
        While True
            ' Prompt the user to enter their choice
            Console.WriteLine("Enter Rock, Paper, or Scissors:")
            userChoice = Console.ReadLine().ToLower()

            ' Generate a random choice for the computer
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
            Console.WriteLine("Do you want to play again? (yes/no)")
            If Console.ReadLine().ToLower() <> "yes" Then
                Exit While
            End If
        End While

        ' End of the program
        Console.WriteLine("Thank you for playing!")
        Console.ReadLine()
    End Sub
End Module

