' This program is a number guessing game.
' The user has to guess a number between 1 and 100.
' The program will give hints if the guess is too high or too low.
' The game continues until the user guesses the correct number.

Module NumberGuessingGame
    Sub Main()
        Dim random As New Random()
        Dim targetNumber As Integer = random.Next(1, 100)
        Dim guess As Integer = 0

        Console.WriteLine("Welcome to the Number Guessing Game!")
        Console.WriteLine("Guess a number between 1 and 100.")

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
    End Sub
End Module

