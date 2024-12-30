' This program is a number guessing game where the user has to guess a randomly generated number between 1 and 100.
' The program will provide feedback on whether the guess is too high, too low, or correct.

Module NumberGuessingGame
    Sub Main()
        Dim random As New Random()
        Dim numberToGuess As Integer = random.Next(1, 101)
        Dim userGuess As Integer = 0

        Console.WriteLine("Welcome to the Number Guessing Game!")
        Console.WriteLine("Guess a number between 1 and 100:")

        While userGuess <> numberToGuess
            Try
                userGuess = Convert.ToInt32(Console.ReadLine())

                If userGuess < numberToGuess Then
                    Console.WriteLine("Too low! Try again:")
                ElseIf userGuess > numberToGuess Then
                    Console.WriteLine("Too high! Try again:")
                Else
                    Console.WriteLine("Congratulations! You guessed the correct number.")
                End If
            Catch ex As Exception
                Console.WriteLine("Please enter a valid number.")
            End Try
        End While
    End Sub
End Module

