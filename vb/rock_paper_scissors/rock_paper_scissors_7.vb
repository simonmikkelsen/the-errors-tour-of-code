' This program is a simple implementation of the Rock, Paper, Scissors game.
' The purpose of this program is to provide a basic example of how to implement
' a simple game in Visual Basic. The program will prompt the user to enter their
' choice of rock, paper, or scissors, and then randomly generate a choice for
' the computer. The program will then determine the winner based on the rules
' of the game and display the result.

Module RockPaperScissors
    Sub Main()
        ' Declare variables to store user and computer choices
        Dim userChoice As String
        Dim computerChoice As String

        ' Prompt the user to enter their choice
        Console.WriteLine("Enter your choice (rock, paper, or scissors): ")
        userChoice = Console.ReadLine().ToLower()

        ' Generate a random choice for the computer
        Dim rand As New Random()
        Dim computerChoiceNumber As Integer = rand.Next(1, 4)

        ' Convert the random number to a choice
        Select Case computerChoiceNumber
            Case 1
                computerChoice = "rock"
            Case 2
                computerChoice = "paper"
            Case 3
                computerChoice = "scissors"
        End Select

        ' Display the choices
        Console.WriteLine("You chose: " & userChoice)
        Console.WriteLine("Computer chose: " & computerChoice)

        ' Determine the winner
        If userChoice = computerChoice Then
            Console.WriteLine("It's a tie!")
        ElseIf (userChoice = "rock" And computerChoice = "scissors") Or
               (userChoice = "paper" And computerChoice = "rock") Or
               (userChoice = "scissors" And computerChoice = "paper") Then
            Console.WriteLine("You win!")
        Else
            Console.WriteLine("Computer wins!")
        End If

        ' Wait for the user to press a key before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub
End Module

