' This program is a simple implementation of the Rock-Paper-Scissors game in Visual Basic .NET.
' The purpose of this program is to demonstrate basic programming concepts such as:
' - Taking user input
' - Generating random choices
' - Using conditional statements to determine the winner
' - Displaying the result to the user

Module RockPaperScissors
    Sub Main()
        ' Declare variables to store user choice, computer choice, and the result
        Dim userChoice As String
        Dim computerChoice As String
        Dim result As String

        ' Display instructions to the user
        Console.WriteLine("Welcome to Rock-Paper-Scissors!")
        Console.WriteLine("Please enter your choice (rock, paper, or scissors):")

        ' Read user input
        userChoice = Console.ReadLine().ToLower()

        ' Generate a random choice for the computer
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

        ' Determine the result of the game
        If userChoice = computerChoice Then
            result = "It's a tie!"
        ElseIf (userChoice = "rock" And computerChoice = "scissors") Or
               (userChoice = "paper" And computerChoice = "rock") Or
               (userChoice = "scissors" And computerChoice = "paper") Then
            result = "You win!"
        Else
            result = "You lose!"
        End If

        ' Display the computer's choice and the result
        Console.WriteLine("Computer chose: " & computerChoice)
        Console.WriteLine(result)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub
End Module

