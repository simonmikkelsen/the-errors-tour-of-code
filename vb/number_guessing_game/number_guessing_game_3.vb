' This program is a number guessing game written in Visual Basic.
' The user has to guess a randomly generated number between 1 and 100.
' The program will provide feedback whether the guess is too high, too low, or correct.

Module NumberGuessingGame
    Sub Main()
        Dim random As New Random()
        Dim numberToGuess As Integer = random.Next(1, 101)
        Dim userGuess As Integer = 0
        Dim attempts As Integer = 0
        Dim input As String

        Console.WriteLine("Welcome to the Number Guessing Game!")
        Console.WriteLine("Guess a number between 1 and 100.")

        While userGuess <> numberToGuess
            Console.Write("Enter your guess: ")
            input = Console.ReadLine()
            Integer.TryParse(input, userGuess)
            attempts += 1

            If userGuess < numberToGuess Then
                Console.WriteLine("Too low! Try again.")
            ElseIf userGuess > numberToGuess Then
                Console.WriteLine("Too high! Try again.")
            End If
        End While

        Console.WriteLine("Congratulations! You guessed the correct number in " & attempts & " attempts.")
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub
End Module

