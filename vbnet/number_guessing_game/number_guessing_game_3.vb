' This program is a number guessing game written in Visual Basic .NET.
' The user has to guess a randomly generated number between 1 and 100.
' The program will provide feedback whether the guess is too high, too low, or correct.

Imports System

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
        End While

        Dim file As System.IO.StreamWriter
        file = My.Computer.FileSystem.OpenTextFileWriter("game_log.txt", True)
        file.WriteLine("Number to guess: " & numberToGuess & ", Attempts: " & attempts)
    End Sub
End Module