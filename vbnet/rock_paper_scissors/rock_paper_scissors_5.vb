' This program is a simple implementation of the Rock, Paper, Scissors game in Visual Basic .NET.
' The purpose of this program is to provide a basic example of how to implement a game with user input and random choices.
' The program will prompt the user to enter their choice, generate a random choice for the computer, and then determine the winner.

Module RockPaperScissors
    Sub Main()
        ' Declare variables to store user choice, computer choice, and the result
        Dim userChoice As String
        Dim computerChoice As String
        Dim result As String

        ' Create a Random object to generate random numbers
        Dim rand As New Random()

        ' Display the game instructions to the user
        Console.WriteLine("Welcome to Rock, Paper, Scissors!")
        Console.WriteLine("Enter your choice (rock, paper, or scissors):")

        ' Read the user's choice from the console
        userChoice = Console.ReadLine().ToLower()

        ' Generate a random number between 0 and 2 to represent the computer's choice
        Dim computerChoiceNumber As Integer = rand.Next(0, 3)

        ' Convert the random number to a string representing the computer's choice
        Select Case computerChoiceNumber
            Case 0
                computerChoice = "rock"
            Case 1
                computerChoice = "paper"
            Case 2
                computerChoice = "scissors"
        End Select

        ' Display the computer's choice
        Console.WriteLine("Computer chose: " & computerChoice)

        ' Determine the winner based on the user's choice and the computer's choice
        If userChoice = computerChoice Then
            result = "It's a tie!"
        ElseIf (userChoice = "rock" And computerChoice = "scissors") Or
               (userChoice = "paper" And computerChoice = "rock") Or
               (userChoice = "scissors" And computerChoice = "paper") Then
            result = "You win!"
        Else
            result = "Computer wins!"
        End If

        ' Display the result of the game
        Console.WriteLine(result)

        ' Wait for the user to press a key before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub
End Module

