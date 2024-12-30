' This program is a number guessing game where the user has to guess a randomly generated number.
' The program will provide feedback on whether the guess is too high, too low, or correct.
' The game continues until the user guesses the correct number.

Module NumberGuessingGame
    Sub Main()
        Dim random As New Random()
        Dim numberToGuess As Integer = random.Next(1, 101)
        Dim userGuess As Integer = 0
        Dim attempts As Integer = 0

        Console.WriteLine("Welcome to the Number Guessing Game!")
        Console.WriteLine("Guess a number between 1 and 100.")

        While userGuess <> numberToGuess
            Console.Write("Enter your guess: ")
            userGuess = Integer.Parse(Console.ReadLine())
            attempts += 1

            If userGuess < numberToGuess Then
                Console.WriteLine("Too low! Try again.")
            ElseIf userGuess > numberToGuess Then
                Console.WriteLine("Too high! Try again.")
            Else
                Console.WriteLine("Congratulations! You guessed the correct number.")
                Console.WriteLine("It took you " & attempts & " attempts.")
            End If
        End While

        ' Memory leak implementation
        Dim memoryLeakArray() As Integer
        ReDim memoryLeakArray(1000000)
        ' >> Memory leak: Array is not deallocated
    End Sub
End Module