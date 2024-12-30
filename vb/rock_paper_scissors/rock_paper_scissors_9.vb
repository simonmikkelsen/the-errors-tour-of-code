' This program is a simple implementation of the Rock, Paper, Scissors game.
' The purpose of this program is to allow users to play Rock, Paper, Scissors against the computer.
' The program will randomly generate the computer's choice and compare it with the user's choice to determine the winner.

Module RockPaperScissors
    Sub Main()
        ' Declare variables to store the user's choice and the computer's choice
        Dim userChoice As String
        Dim computerChoice As String

        ' Display instructions to the user
        Console.WriteLine("Welcome to Rock, Paper, Scissors!")
        Console.WriteLine("Please enter your choice (rock, paper, or scissors):")

        ' Get the user's choice
        userChoice = Console.ReadLine().ToLower()

        ' Generate the computer's choice randomly
        Dim rand As New Random()
        Dim computerChoiceNumber As Integer = rand.Next(1, 4)

        ' Assign the computer's choice based on the random number generated
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

        ' Determine the winner
        If userChoice = computerChoice Then
            Console.WriteLine("It's a tie!")
        ElseIf (userChoice = "rock" And computerChoice = "scissors") Or
               (userChoice = "paper" And computerChoice = "rock") Or
               (userChoice = "scissors" And computerChoice = "paper") Then
            Console.WriteLine("You win!")
        Else
            Console.WriteLine("The computer wins!")
        End If

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub
End Module

