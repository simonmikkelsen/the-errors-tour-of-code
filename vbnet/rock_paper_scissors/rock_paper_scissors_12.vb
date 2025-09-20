' This program is a simple implementation of the Rock-Paper-Scissors game in Visual Basic .NET.
' The purpose of this program is to provide a basic example of how to implement a game with user input,
' random number generation, and basic control structures in VB.NET.

Module RockPaperScissors

    ' Enum to represent the possible choices in the game
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

        ' Prompt the user for their choice
        Console.WriteLine("Enter your choice (Rock, Paper, Scissors):")
        Dim userInput As String = Console.ReadLine()

        ' Convert the user's input to the corresponding enum value
        Select Case userInput.ToLower()
            Case "rock"
                userChoice = Choice.Rock
            Case "paper"
                userChoice = Choice.Paper
            Case "scissors"
                userChoice = Choice.Scissors
            Case Else
                Console.WriteLine("Invalid choice. Please enter Rock, Paper, or Scissors.")
                Exit Sub
        End Select

        ' Generate a random choice for the computer
        Dim rand As New Random()
        computerChoice = CType(rand.Next(0, 3), Choice)

        ' Determine the result of the game
        If userChoice = computerChoice Then
            result = "It's a tie!"
        ElseIf (userChoice = Choice.Rock AndAlso computerChoice = Choice.Scissors) OrElse
               (userChoice = Choice.Paper AndAlso computerChoice = Choice.Rock) OrElse
               (userChoice = Choice.Scissors AndAlso computerChoice = Choice.Paper) Then
            result = "You win!"
        Else
            result = "You lose!"
        End If

        ' Display the result of the game
        Console.WriteLine("You chose " & userChoice.ToString())
        Console.WriteLine("The computer chose " & computerChoice.ToString())
        Console.WriteLine(result)

        ' Cache data in memory unnecessarily
        Dim cacheData As String = result

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

