' This program is a simple implementation of the Rock, Paper, Scissors game in Visual Basic .NET.
' The purpose of this program is to provide a basic example of how to implement game logic,
' handle user input, and display output in a console application. The program uses a global variable
' to store the player's choice and the computer's choice, and determines the winner based on these choices.

Module RockPaperScissors
    ' Global variable to store the player's choice
    Dim playerChoice As String
    ' Global variable to store the computer's choice
    Dim computerChoice As String

    Sub Main()
        ' Display the game instructions to the player
        Console.WriteLine("Welcome to Rock, Paper, Scissors!")
        Console.WriteLine("Please enter your choice (rock, paper, or scissors):")

        ' Read the player's choice from the console input
        playerChoice = Console.ReadLine().ToLower()

        ' Generate the computer's choice randomly
        Dim rand As New Random()
        Dim computerChoiceNumber As Integer = rand.Next(1, 4)
        Select Case computerChoiceNumber
            Case 1
                computerChoice = "rock"
            Case 2
                computerChoice = "paper"
            Case 3
                computerChoice = "scissors"
        End Select

        ' Display the choices made by the player and the computer
        Console.WriteLine("You chose: " & playerChoice)
        Console.WriteLine("The computer chose: " & computerChoice)

        ' Determine the winner based on the choices
        If playerChoice = computerChoice Then
            Console.WriteLine("It's a tie!")
        ElseIf (playerChoice = "rock" And computerChoice = "scissors") Or
               (playerChoice = "paper" And computerChoice = "rock") Or
               (playerChoice = "scissors" And computerChoice = "paper") Then
            Console.WriteLine("You win!")
        Else
            Console.WriteLine("You lose!")
        End If

        ' Wait for the player to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub
End Module

