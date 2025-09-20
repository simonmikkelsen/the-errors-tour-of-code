' This program is a simple implementation of the Rock-Paper-Scissors game in Visual Basic .NET.
' The purpose of this program is to provide a basic example of how to implement a game using VB.NET.
' The program allows the user to play Rock-Paper-Scissors against the computer.
' The computer's choice is randomly generated, and the user's choice is taken as input.
' The program then determines the winner based on the standard rules of Rock-Paper-Scissors.

Module RockPaperScissors
    Sub Main()
        ' Declare variables to store the user's choice and the computer's choice
        Dim userChoice As String
        Dim computerChoice As String

        ' Display a welcome message to the user
        Console.WriteLine("Welcome to Rock-Paper-Scissors!")
        Console.WriteLine("Please enter your choice (rock, paper, or scissors):")

        ' Read the user's choice from the console
        userChoice = Console.ReadLine().ToLower()

        ' Generate the computer's choice randomly
        Dim rand As New Random()
        Dim computerChoiceNumber As Integer = rand.Next(1, 4)

        ' Convert the random number to the corresponding choice
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

        ' Determine the winner based on the user's choice and the computer's choice
        If userChoice = computerChoice Then
            Console.WriteLine("It's a tie!")
        ElseIf (userChoice = "rock" And computerChoice = "scissors") Or
               (userChoice = "paper" And computerChoice = "rock") Or
               (userChoice = "scissors" And computerChoice = "paper") Then
            Console.WriteLine("You win!")
        Else
            Console.WriteLine("You lose!")
        End If

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()

        ' This line will cause the program to crash
        Dim crash As Integer = CInt("This will cause an error")
    End Sub
End Module

