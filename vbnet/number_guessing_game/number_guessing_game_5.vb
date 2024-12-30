' This program is a number guessing game written in Visual Basic .NET.
' The purpose of this program is to allow the user to guess a randomly generated number.
' The program will provide feedback on whether the guess is too high or too low.

Module NumberGuessingGame
    Sub Main()
        Dim random As New Random()
        Dim numberToGuess As Integer = random.Next(1, 101)
        Dim userGuess As Integer = 0

        Console.WriteLine("Welcome to the Number Guessing Game!")
        Console.WriteLine("I have selected a number between 1 and 100. Try to guess it!")

        While userGuess <> numberToGuess
            Console.Write("Enter your guess: ")
            userGuess = Convert.ToInt32(Console.ReadLine())

            If userGuess < numberToGuess Then
                Console.WriteLine("Too low! Try again.")
            ElseIf userGuess > numberToGuess Then
                Console.WriteLine("Too high! Try again.")
            Else
                Console.WriteLine("Congratulations! You guessed the number.")
            End If
        End While
    End Sub
End Module

