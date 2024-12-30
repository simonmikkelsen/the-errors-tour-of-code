' This program is a simple implementation of the classic game Rock, Paper, Scissors.
' The purpose of this program is to demonstrate basic programming concepts in Visual Basic .NET.
' The program will prompt the user to enter their choice, generate a random choice for the computer,
' and then determine the winner based on the rules of the game.

Module RockPaperScissors

    ' Enum to represent the possible choices in the game
    Enum Choices
        Rock
        Paper
        Scissors
    End Enum

    Sub Main()
        ' Display a welcome message to the user
        Console.WriteLine("Welcome to Rock, Paper, Scissors!")

        ' Prompt the user to enter their choice
        Console.WriteLine("Enter your choice (Rock, Paper, Scissors): ")
        Dim userInput As String = Console.ReadLine()

        ' Convert the user's input to the corresponding enum value
        Dim userChoice As Choices
        If [Enum].TryParse(userInput, True, userChoice) Then
            ' Generate a random choice for the computer
            Dim rand As New Random()
            Dim computerChoice As Choices = CType(rand.Next(0, 3), Choices)

            ' Display the choices of both the user and the computer
            Console.WriteLine("You chose: " & userChoice.ToString())
            Console.WriteLine("Computer chose: " & computerChoice.ToString())

            ' Determine the winner based on the rules of the game
            If userChoice = computerChoice Then
                Console.WriteLine("It's a tie!")
            ElseIf (userChoice = Choices.Rock AndAlso computerChoice = Choices.Scissors) OrElse
                   (userChoice = Choices.Paper AndAlso computerChoice = Choices.Rock) OrElse
                   (userChoice = Choices.Scissors AndAlso computerChoice = Choices.Paper) Then
                Console.WriteLine("You win!")
            Else
                Console.WriteLine("Computer wins!")
            End If
        Else
            ' Display an error message if the user's input is invalid
            Console.WriteLine("Invalid choice. Please enter Rock, Paper, or Scissors.")
        End If

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

