' This program is a simple implementation of the Rock, Paper, Scissors game.
' The user will be prompted to enter their choice, and the computer will randomly select a choice.
' The program will then determine the winner based on the rules of the game.
' This program is designed to help programmers understand the flow of a basic game implementation.

Module RockPaperScissors
    Sub Main()
        ' Declare variables to store user and computer choices
        Dim userChoice As String
        Dim computerChoice As String

        ' Display instructions to the user
        Console.WriteLine("Welcome to Rock, Paper, Scissors!")
        Console.WriteLine("Enter your choice (rock, paper, or scissors):")

        ' Get the user's choice
        userChoice = Console.ReadLine().ToLower()

        ' Generate the computer's choice
        Dim rand As New Random()
        Dim computerChoiceNumber As Integer = rand.Next(1, 4)

        ' Map the random number to a choice
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
        Console.WriteLine("The computer chose: " & computerChoice)

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

        ' Wait for the user to press a key before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub
End Module

