' This program is a number guessing game written in Visual Basic .NET.
' The purpose of the game is to guess a randomly generated number between 1 and 100.
' The program will provide feedback whether the guess is too high, too low, or correct.

Module NumberGuessingGame
    Sub Main()
        Dim random As New Random()
        Dim numberToGuess As Integer = random.Next(1, 101)
        Dim userGuess As Integer = 0

        Console.WriteLine("Welcome to the Number Guessing Game!")
        Console.WriteLine("Guess a number between 1 and 100:")

        While userGuess <> numberToGuess
            userGuess = Convert.ToInt32(Console.ReadLine())

            If userGuess > numberToGuess Then
                Console.WriteLine("Too high! Try again:")
            ElseIf userGuess < numberToGuess Then
                Console.WriteLine("Too low! Try again:")
            Else
                Console.WriteLine("Congratulations! You guessed the correct number.")
            End If
        End While

    End Sub
End Module