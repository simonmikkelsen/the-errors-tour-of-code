' This program is a prime number checker written in Visual Basic.
' The purpose of this program is to determine whether a given number is a prime number.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
' The program uses regular expressions to validate the input and check for prime numbers.

Imports System.Text.RegularExpressions

Module PrimeNumberChecker

    ' Function to check if a number is prime
    Function IsPrime(ByVal number As Integer) As Boolean
        ' A prime number is greater than 1
        If number <= 1 Then Return False

        ' Check for factors other than 1 and the number itself
        For i As Integer = 2 To Math.Sqrt(number)
            If number Mod i = 0 Then Return False
        Next

        Return True
    End Function

    Sub Main()
        ' Regular expression to validate that the input is a positive integer
        Dim regex As New Regex("^\d+$")

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is prime:")
        Dim input As String = Console.ReadLine()

        ' Validate the input using the regular expression
        If regex.IsMatch(input) Then
            Dim number As Integer = Integer.Parse(input)

            ' Check if the number is prime
            If IsPrime(number) Then
                Console.WriteLine(number & " is a prime number.")
            Else
                Console.WriteLine(number & " is not a prime number.")
            End If
        Else
            Console.WriteLine("Invalid input. Please enter a positive integer.")
        End If
    End Sub

End Module

