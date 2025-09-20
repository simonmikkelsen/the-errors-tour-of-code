' This is a number guessing game program written in Visual Basic .NET.
' The purpose of this program is to allow the user to guess a randomly generated number between 1 and 100.
' The program will provide feedback on whether the guess is too high, too low, or correct.

Module NumberGuessingGame
    Sub Main()
        Dim random As New Random()
        Dim numberToGuess As Integer = random.Next(1, 101)
        Dim userGuess As Integer = 0
        Dim attempts As Integer = 0

        Console.WriteLine("Welcome to the Number Guessing Game!")
        Console.WriteLine("Try to guess the number between 1 and 100.")

        While userGuess <> numberToGuess
            Console.Write("Enter your guess: ")
            userGuess = Convert.ToInt32(Console.ReadLine())
            attempts += 1

            If userGuess > numberToGuess Then
                Console.WriteLine("Too high! Try again.")
            ElseIf userGuess < numberToGuess Then
                Console.WriteLine("Too low! Try again.")
            Else
                Console.WriteLine("Congratulations! You guessed the number in " & attempts & " attempts.")
            End If
        End While

        Console.WriteLine("Thank you for playing the Number Guessing Game!")
    End Sub
End Module

