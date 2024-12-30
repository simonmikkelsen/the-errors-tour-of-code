' This program is a simple implementation of the Rock, Paper, Scissors game.
' The purpose of this program is to provide a basic example of how to use 
' Visual Basic to create a console-based game. The program will prompt the 
' user to enter their choice of rock, paper, or scissors, and then the 
' computer will randomly select its choice. The winner will be determined 
' based on the standard rules of the game.

Module RockPaperScissors

    Sub Main()
        ' Declare variables to store user and computer choices
        Dim userChoice As String
        Dim computerChoice As String

        ' Declare a Random object to generate random numbers
        Dim rand As New Random()

        ' Display instructions to the user
        Console.WriteLine("Welcome to Rock, Paper, Scissors!")
        Console.WriteLine("Enter your choice (rock, paper, or scissors):")

        ' Get the user's choice
        userChoice = Console.ReadLine().ToLower()

        ' Generate the computer's choice
        Dim computerChoiceNumber As Integer = rand.Next(1, 4)
        Select Case computerChoiceNumber
            Case 1
                computerChoice = "rock"
            Case 2
                computerChoice = "paper"
            Case 3
                computerChoice = "scissors"
        End Select

        ' Display the computer's choice
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

        ' Prompt the user to play again
        Console.WriteLine("Do you want to play again? (yes or no)")
        Dim playAgain As String = Console.ReadLine().ToLower()

        ' If the user wants to play again, restart the game
        If playAgain = "yes" Then
            Main()
        End If

        ' End of the program
        Console.WriteLine("Thank you for playing!")
    End Sub

End Module

