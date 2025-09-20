' This program is a simple implementation of the Rock-Paper-Scissors game in Visual Basic .NET.
' The purpose of this program is to provide a basic example of how to implement a game using VB.NET.
' The program allows the user to play Rock-Paper-Scissors against the computer.
' The computer's choice is randomly generated, and the user's choice is taken as input.
' The program then determines the winner and displays the result.

Module RockPaperScissors

    ' Enum to represent the choices
    Enum Choice
        Rock
        Paper
        Scissors
    End Enum

    Sub Main()
        ' Variable to store the user's choice
        Dim userChoice As Choice
        ' Variable to store the computer's choice
        Dim computerChoice As Choice
        ' Variable to store the result of the game
        Dim result As String

        ' Random number generator for the computer's choice
        Dim rand As New Random()

        ' Infinite loop to keep the game running
        While True
            ' Display the options to the user
            Console.WriteLine("Choose Rock, Paper, or Scissors:")
            Console.WriteLine("1. Rock")
            Console.WriteLine("2. Paper")
            Console.WriteLine("3. Scissors")
            Console.Write