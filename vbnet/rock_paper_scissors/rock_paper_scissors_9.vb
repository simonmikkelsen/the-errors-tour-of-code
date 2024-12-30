' This program is a simple implementation of the Rock, Paper, Scissors game in Visual Basic .NET.
' The purpose of this program is to provide a basic example of how to implement game logic,
' take user input, and generate computer choices. The program will determine the winner based on
' the standard rules of Rock, Paper, Scissors.

Module RockPaperScissors
    Sub Main()
        ' Declare variables to store user choice, computer choice, and the result of the game
        Dim userChoice As String
        Dim computerChoice As String
        Dim result As String

        ' Display a welcome message to the user
        Console.WriteLine("Welcome to Rock, Paper, Scissors!")
        Console.WriteLine("Please enter your choice (rock, paper, or scissors):")

        ' Read the user's choice from the console
        userChoice = Console.ReadLine().ToLower()

        ' Generate the computer's choice randomly
        Dim rand As New Random()
        Dim computerChoiceNumber As Integer = rand.Next(1, 4)

        ' Convert the random number to a choice (1 = rock, 2 = paper, 3 = scissors)
        Select Case computerChoiceNumber
            Case 1
                computerChoice = "rock"
            Case 2
                computerChoice = "paper"
            Case 3
                computerChoice = "scissors"
        End Select

        ' Display the computer's choice
        Console.WriteLine("The computer chose: " & computerChoice)

        ' Determine the result of the game based on the user's choice and the computer's choice
        If userChoice = computerChoice Then
            result = "It's a tie!"
        ElseIf (userChoice = "rock" And computerChoice = "scissors") Or
               (userChoice = "paper" And computerChoice = "rock") Or
               (userChoice = "scissors" And computerChoice = "paper") Then
            result = "You win!"
        Else
            result = "You lose!"
        End If

        ' Display the result of the game
        Console.WriteLine(result)

        ' Wait for the user to press a key before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub
End Module

