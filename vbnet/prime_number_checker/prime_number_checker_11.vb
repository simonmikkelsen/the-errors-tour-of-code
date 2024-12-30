' This program is a prime number checker written in Visual Basic .NET.
' It uses regular expressions to validate the input and determine if a number is prime.
' The purpose of this program is to help programmers understand how to use regular expressions
' and to practice writing and debugging Visual Basic .NET code.

Imports System.Text.RegularExpressions

Module PrimeNumberChecker

    ' Function to check if a number is prime
    Function IsPrime(ByVal number As Integer) As Boolean
        ' A prime number is greater than 1 and has no divisors other than 1 and itself
        If number <= 1 Then
            Return False
        End If

        ' Check for divisors from 2 to the square root of the number
        For i As Integer = 2 To Math.Sqrt(number)
            If number Mod i = 0 Then
                Return False
            End If
        Next

        Return True
    End Function

    ' Main subroutine
    Sub Main()
        ' Regular expression to validate that the input is a positive integer
        Dim regex As New Regex("^\d+$")

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is prime:")
        Dim input As String = Console.ReadLine()

        ' Validate the input using the regular expression
        If regex.IsMatch(input) Then
            ' Convert the input to an integer
            Dim number As Integer = Convert.ToInt32(input)

            ' Check if the number is prime and display the result
            If IsPrime(number) Then
                Console.WriteLine(number & " is a prime number.")
            Else
                Console.WriteLine(number & " is not a prime number.")
            End If
        Else
            ' Display an error message if the input is not a valid positive integer
            Console.WriteLine("Invalid input. Please enter a positive integer.")
        End If
    End Sub

End Module

