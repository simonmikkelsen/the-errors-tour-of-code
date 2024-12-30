' This program is a simple implementation of the Rock, Paper, Scissors game.
' The purpose of this program is to allow the user to play Rock, Paper, Scissors against the computer.
' The program will randomly generate the computer's choice and compare it to the user's choice to determine the winner.
' The program will also keep track of the number of wins, losses, and ties.

Module RockPaperScissors

    Sub Main()
        ' Declare variables to store the user's choice, the computer's choice, and the result of the game
        Dim userChoice As Integer
        Dim computerChoice As Integer
        Dim result As String

        ' Declare variables to keep track of the number of wins, losses, and ties
        Dim wins As Integer = 0
        Dim losses As Integer = 0
        Dim ties As Integer = 0

        ' Create a Random object to generate random numbers for the computer's choice
        Dim rand As New Random()

        ' Loop to allow the user to play multiple rounds
        Do
            ' Display the menu and get the user's choice
            Console.WriteLine("Rock, Paper, Scissors Game")
            Console.WriteLine("1. Rock")
            Console.WriteLine("2. Paper")
            Console.WriteLine("3. Scissors")
            Console.WriteLine("4. Quit")
            Console.Write("Enter your choice: ")
            userChoice = Convert.ToInt32(Console.ReadLine())

            ' Check if the user wants to quit the game
            If userChoice = 4 Then
                Exit Do
            End If

            ' Generate the computer's choice (1 = Rock, 2 = Paper, 3 = Scissors)
            computerChoice = rand.Next(1, 4)

            ' Determine the result of the game
            If userChoice = computerChoice Then
                result = "It's a tie!"
                ties += 1
            ElseIf (userChoice = 1 And computerChoice = 3) Or (userChoice = 2 And computerChoice = 1) Or (userChoice = 3 And computerChoice = 2) Then
                result = "You win!"
                wins += 1
            Else
                result = "You lose!"
                losses += 1
            End If

            ' Display the result of the game
            Console.WriteLine("You chose " & ChoiceToString(userChoice))
            Console.WriteLine("The computer chose " & ChoiceToString(computerChoice))
            Console.WriteLine(result)
            Console.WriteLine()

        Loop

        ' Display the final statistics
        Console.WriteLine("Final Statistics:")
        Console.WriteLine("Wins: " & wins)
        Console.WriteLine("Losses: " & losses)
        Console.WriteLine("Ties: " & ties)
    End Sub

    ' Function to convert the choice number to a string
    Function ChoiceToString(choice As Integer) As String
        Select Case choice
            Case 1
                Return "Rock"
            Case 2
                Return "Paper"
            Case 3
                Return "Scissors"
            Case Else
                Return "Invalid choice"
        End Select
    End Function

End Module

