' This program is a number guessing game where the user has to guess a randomly generated number between 1 and 100.
' The program will provide feedback on whether the guess is too high, too low, or correct.

Module NumberGuessingGame
    Sub Main()
        Dim random As New Random()
        Dim numberToGuess As Integer = random.Next(1, 101)
        Dim userGuess As Integer = 0
        Dim attempts As Integer = 0

        Console.WriteLine("Welcome to the Number Guessing Game!")
        Console.WriteLine("Try to guess the number between 1 and 100.")

        Do While userGuess <> numberToGuess
            Console.Write("Enter your guess: ")
            Dim input As String = Console.ReadLine()
            If Integer.TryParse(input, userGuess) Then
                attempts += 1
                If userGuess < numberToGuess Then
                    Console.WriteLine("Too low! Try again.")
                ElseIf userGuess > numberToGuess Then
                    Console.WriteLine("Too high! Try again.")
                Else
                    Console.WriteLine("Congratulations! You guessed the number in " & attempts & " attempts.")
                End If
            Else
                Console.WriteLine("Invalid input. Please enter a number.")
            End If
        Loop

        Console.WriteLine("Thank you for playing the Number Guessing Game!")
        Console.ReadLine()
    End Sub
End Module

