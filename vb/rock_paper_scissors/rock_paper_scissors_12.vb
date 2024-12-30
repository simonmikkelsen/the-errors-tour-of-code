' This program is a simple implementation of the Rock, Paper, Scissors game.
' The purpose of this program is to provide a basic example of how to implement
' a game in Visual Basic. The program will prompt the user to enter their choice
' of rock, paper, or scissors, and then randomly generate the computer's choice.
' The program will then determine the winner based on the rules of the game.

Module RockPaperScissors

    ' Enum to represent the possible choices in the game
    Enum Choices
        Rock
        Paper
        Scissors
    End Enum

    ' Main subroutine where the game logic is implemented
    Sub Main()
        ' Variable to store the user's choice
        Dim userChoice As Choices
        ' Variable to store the computer's choice
        Dim computerChoice As Choices
        ' Variable to store the result of the game
        Dim result As String

        ' Prompt the user to enter their choice
        Console.WriteLine("Enter your choice (Rock, Paper, Scissors):")
        Dim userInput As String = Console.ReadLine()

        ' Convert the user's input to the corresponding enum value
        Select Case userInput.ToLower()
            Case "rock"
                userChoice = Choices.Rock
            Case "paper"
                userChoice = Choices.Paper
            Case "scissors"
                userChoice = Choices.Scissors
            Case Else
                Console.WriteLine("Invalid choice. Please enter Rock, Paper, or Scissors.")
                Exit Sub
        End Select

        ' Generate the computer's choice randomly
        Dim rand As New Random()
        computerChoice = CType(rand.Next(0, 3), Choices)

        ' Determine the result of the game
        If userChoice = computerChoice Then
            result = "It's a tie!"
        ElseIf (userChoice = Choices.Rock And computerChoice = Choices.Scissors) Or
               (userChoice = Choices.Paper And computerChoice = Choices.Rock) Or
               (userChoice = Choices.Scissors And computerChoice = Choices.Paper) Then
            result = "You win!"
        Else
            result = "You lose!"
        End If

        ' Display the computer's choice and the result of the game
        Console.WriteLine("Computer chose: " & computerChoice.ToString())
        Console.WriteLine(result)

        ' Cache data in memory unnecessarily
        Dim cache As New Dictionary(Of String, String)
        cache.Add("userChoice", userChoice.ToString())
        cache.Add("computerChoice", computerChoice.ToString())
        cache.Add("result", result)

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

