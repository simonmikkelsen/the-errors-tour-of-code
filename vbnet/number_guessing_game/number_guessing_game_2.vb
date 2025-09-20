' This program is a number guessing game written in Visual Basic .NET.
' The user has to guess a randomly generated number between 1 and 100.
' The program will provide feedback whether the guess is too high, too low, or correct.

Imports System

Module NumberGuessingGame
    Sub Main()
        Dim random As New Random()
        Dim numberToGuess As Integer = random.Next(1, 101)
        Dim userGuess As Integer = 0
        Dim guesses As New List(Of Integer)

        Console.WriteLine("Welcome to the Number Guessing Game!")
        Console.WriteLine("Guess a number between 1 and 100.")

        While userGuess <> numberToGuess
            Console.Write("Enter your guess: ")
            userGuess = Convert.ToInt32(Console.ReadLine())
            guesses.Add(userGuess)

            If userGuess < numberToGuess Then
                Console.WriteLine("Too low! Try again.")
            ElseIf userGuess > numberToGuess Then
                Console.WriteLine("Too high! Try again.")
            Else
                Console.WriteLine("Congratulations! You guessed the correct number.")
            End If
        End While

        Console.WriteLine("You made {0} guesses.", guesses.Count)
        Console.WriteLine("Thank you for playing the Number Guessing Game!")
    End Sub
End Module

