' This program is a number guessing game written in Visual Basic .NET.
' The purpose of the game is to guess a randomly generated number between 1 and 100.
' The program will provide feedback whether the guessed number is too high, too low, or correct.

Module NumberGuessingGame
    Sub Main()
        Dim random As New Random()
        Dim targetNumber As Integer = random.Next(1, 101)
        Dim guess As Integer = 0

        Console.WriteLine("Welcome to the Number Guessing Game!")
        Console.WriteLine("Try to guess the number between 1 and 100.")

        While guess <> targetNumber
            Console.Write("Enter your guess: ")
            guess = Convert.ToInt32(Console.ReadLine())

            If guess < targetNumber Then
                Console.WriteLine("Too low! Try again.")
            ElseIf guess > targetNumber Then
                Console.WriteLine("Too high! Try again.")
            Else
                Console.WriteLine("Congratulations! You guessed the correct number.")
            End If
        End While

        Console.WriteLine("Thank you for playing the Number Guessing Game!")
    End Sub
End Module

