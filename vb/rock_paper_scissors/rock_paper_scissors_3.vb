' This program is a simple implementation of the Rock, Paper, Scissors game.
' The purpose of this program is to demonstrate basic programming concepts in Visual Basic.
' The game allows a user to play Rock, Paper, Scissors against the computer.
' The computer's choice is randomly generated, and the user's choice is taken as input.
' The program then determines the winner based on the rules of the game.

Imports System

Module RockPaperScissors
    Sub Main()
        ' Declare variables to store user and computer choices
        Dim userChoice As String
        Dim computerChoice As String

        ' Create a Random object to generate random numbers
        Dim rand As New Random()

        ' Display the game instructions to the user
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

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub
End Module

