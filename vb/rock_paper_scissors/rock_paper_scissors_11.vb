' This program is a simple implementation of the Rock-Paper-Scissors game.
' The purpose of this program is to demonstrate the use of regular expressions
' in Visual Basic and to provide a detailed example with verbose comments.

Imports System.Text.RegularExpressions

Module RockPaperScissors

    Sub Main()
        ' Declare variables to store user and computer choices
        Dim userChoice As String
        Dim computerChoice As String

        ' Create a random number generator for the computer's choice
        Dim rand As New Random()

        ' Display the game instructions
        Console.WriteLine("Welcome to Rock-Paper-Scissors!")
        Console.WriteLine("Enter your choice (rock, paper, or scissors):")

        ' Get the user's choice
        userChoice = Console.ReadLine().ToLower()

        ' Validate the user's choice using regular expressions
        Dim validChoicePattern As String = "^(rock|paper|scissors)$"
        If Not Regex.IsMatch(userChoice, validChoicePattern) Then
            Console.WriteLine("Invalid choice. Please enter rock, paper, or scissors.")
            Return
        End If

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

        ' Determine the winner using regular expressions
        Dim winPattern As String = userChoice & computerChoice
        If Regex.IsMatch(winPattern, "rockscissors|paperrock|scissorspaper") Then
            Console.WriteLine("You win!")
        ElseIf Regex.IsMatch(winPattern, "scissorsrock|rockpaper|paperscissors") Then
            Console.WriteLine("Computer wins!")
        Else
            Console.WriteLine("It's a tie!")
        End If

        ' End the program
        Console.WriteLine("Thanks for playing Rock-Paper-Scissors!")
    End Sub

End Module

