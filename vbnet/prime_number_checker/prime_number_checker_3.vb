' This program is a prime number checker written in Visual Basic .NET.
' The purpose of this program is to determine whether a given number is prime.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
' The program will prompt the user to enter a number and then check if it is prime.
' If the number is prime, it will display a message indicating that the number is prime.
' If the number is not prime, it will display a message indicating that the number is not prime.

Imports System

Module PrimeNumberChecker

    ' Main subroutine that serves as the entry point of the program
    Sub Main()
        ' Declare a variable to hold the user's input
        Dim input As String

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is prime:")
        input = Console.ReadLine()

        ' Convert the input to an integer
        Dim number As Integer
        If Integer.TryParse(input, number) Then
            ' Check if the number is prime
            If IsPrime(number) Then
                Console.WriteLine(number & " is a prime number.")
            Else
                Console.WriteLine(number & " is not a prime number.")
            End If
        Else
            Console.WriteLine("Invalid input. Please enter a valid integer.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to check if a number is prime
    Function IsPrime(ByVal num As Integer) As Boolean
        ' Handle special cases
        If num <= 1 Then Return False
        If num = 2 Then Return True

        ' Check for factors other than 1 and the number itself
        For i As Integer = 2 To Math.Sqrt(num)
            If num Mod i = 0 Then
                Return False
            End If
        Next

        ' If no factors were found, the number is prime
        Return True
    End Function

End Module

