' This program is a number guessing game where the user has to guess a randomly generated number between 1 and 100.
' The program will provide feedback on whether the guess is too high, too low, or correct.

Module NumberGuessingGame
    Sub Main()
        Dim random As New Random()
        Dim targetNumber As Integer = random.Next(1, 101)
        Dim guess As Integer
        Dim attempts As Integer = 0

        Console.WriteLine("Welcome to the Number Guessing Game!")
        Console.WriteLine("Try to guess the number between 1 and 100.")

        Do
            Console.Write("Enter your guess: ")
            guess = Integer.Parse(Console.ReadLine())
            attempts += 1

            If guess < targetNumber Then
                Console.WriteLine("Too low! Try again.")
            ElseIf guess > targetNumber Then
                Console.WriteLine("Too high! Try again.")
            Else
                Console.WriteLine("Congratulations! You've guessed the number in " & attempts & " attempts.")
                Exit Do
            End If
        Loop

        Console.WriteLine("Thank you for playing the Number Guessing Game!")
        Console.ReadLine()
    End Sub
End Module

