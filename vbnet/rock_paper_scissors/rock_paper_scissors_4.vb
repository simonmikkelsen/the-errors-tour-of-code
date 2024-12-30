' This program is a simple implementation of the Rock, Paper, Scissors game in Visual Basic .NET.
' The purpose of this program is to provide a basic example of how to implement game logic,
' handle user input, and use conditional statements to determine the outcome of the game.
' The program will prompt the user to enter their choice (rock, paper, or scissors),
' generate a random choice for the computer, and then determine the winner based on the rules of the game.

Module RockPaperScissors

    Sub Main()
        ' Declare variables to store user choice, computer choice, and the result of the game
        Dim userChoice As String
        Dim computerChoice As String
        Dim result As String

        ' Create a Random object to generate random choices for the computer
        Dim rand As New Random()

        ' Start the game loop
        Do
            ' Prompt the user to enter their choice
            Console.WriteLine("Enter your choice (rock, paper, or scissors): ")
            userChoice = Console.ReadLine().ToLower()

            ' Generate a random choice for the computer
            Select Case rand.Next(1, 4)
                Case 1
                    computerChoice = "rock"
                Case 2
                    computerChoice = "paper"
                Case 3
                    computerChoice = "scissors"
            End Select

            ' Determine the result of the game based on user and computer choices
            If userChoice = computerChoice Then
                result = "It's a tie!"
            ElseIf (userChoice = "rock" And computerChoice = "scissors") Or
                   (userChoice = "paper" And computerChoice = "rock") Or
                   (userChoice = "scissors" And computerChoice = "paper") Then
                result = "You win!"
            Else
                result = "You lose!"
            End If

            ' Display the computer's choice and the result of the game
            Console.WriteLine("Computer chose: " & computerChoice)
            Console.WriteLine(result)

            ' Ask the user if they want to play again
            Console.WriteLine("Do you want to play again? (yes or no): ")
            ' This line causes an infinite loop if the user enters anything other than "yes" or "no"
        Loop While Console.ReadLine().ToLower() = "yes"

    End Sub

End Module

