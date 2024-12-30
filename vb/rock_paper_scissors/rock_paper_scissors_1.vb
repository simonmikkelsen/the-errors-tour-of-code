' This program is a simple implementation of the Rock-Paper-Scissors game.
' The purpose of this program is to demonstrate basic programming concepts in Visual Basic.
' The game allows the user to input their choice and the computer randomly selects a choice.
' The program then determines the winner based on the rules of Rock-Paper-Scissors.

Module RockPaperScissors

    Sub Main()
        ' Declare variables to store user choice, computer choice, and the result
        Dim userChoice As String
        Dim computerChoice As String
        Dim result As String

        ' Display instructions to the user
        Console.WriteLine("Welcome to Rock-Paper-Scissors!")
        Console.WriteLine("Please enter your choice (rock, paper, or scissors):")

        ' Get user input
        userChoice = Console.ReadLine().ToLower()

        ' Generate a random choice for the computer
        Dim rand As New Random()
        Dim computerChoiceNumber As Integer = rand.Next(1, 4)

        ' Convert the random number to a choice (1 = rock, 2 = paper, 3 = scissors)
        If computerChoiceNumber = 1 Then
            computerChoice = "rock"
        ElseIf computerChoiceNumber = 2 Then
            computerChoice = "paper"
        Else
            computerChoice = "scissors"
        End If

        ' Display the computer's choice
        Console.WriteLine("Computer chose: " & computerChoice)

        ' Determine the result of the game
        If userChoice = computerChoice Then
            result = "It's a tie!"
        ElseIf (userChoice = "rock" And computerChoice = "scissors") Or
               (userChoice = "paper" And computerChoice = "rock") Or
               (userChoice = "scissors" And computerChoice = "paper") Then
            result = "You win!"
        Else
            result = "Computer wins!"
        End If

        ' Display the result
        Console.WriteLine(result)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

