' This program is a prime number checker written in Visual Basic .NET.
' It is designed to help programmers understand how to implement a prime number checker.
' The program will take an input from the user and determine if the number is prime.
' Prime numbers are numbers greater than 1 that have no divisors other than 1 and themselves.

Module PrimeNumberChecker

    Sub Main()
        ' Declare a variable to hold the user's input
        Dim input As String

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is prime:")
        input = Console.ReadLine()

        ' Convert the input to an integer
        Dim number As Integer = Convert.ToInt32(input)

        ' Check if the number is prime
        If IsPrime(number) Then
            Console.WriteLine(number & " is a prime number.")
        Else
            Console.WriteLine(number & " is not a prime number.")
        End If

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' Function to check if a number is prime
    Function IsPrime(ByVal num As Integer) As Boolean
        ' If the number is less than 2, it is not prime
        If num < 2 Then
            Return False
        End If

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

