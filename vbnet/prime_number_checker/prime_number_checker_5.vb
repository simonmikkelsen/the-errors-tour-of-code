' This program is a prime number checker written in Visual Basic .NET.
' The purpose of this program is to determine whether a given number is prime or not.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

Module PrimeNumberChecker

    ' The main subroutine where the program execution starts
    Sub Main()
        ' Declare a variable to hold the number to be checked
        Dim number As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is prime:")
        number = Convert.ToInt32(Console.ReadLine())

        ' Call the IsPrime function to check if the number is prime
        If IsPrime(number) Then
            Console.WriteLine(number & " is a prime number.")
        Else
            Console.WriteLine(number & " is not a prime number.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to check if a number is prime
    Function IsPrime(ByVal num As Integer) As Boolean
        ' A prime number must be greater than 1
        If num <= 1 Then
            Return False
        End If

        ' Loop through all numbers from 2 to the square root of the number
        For i As Integer = 2 To Math.Sqrt(num) + 1
            ' If the number is divisible by any of these numbers, it is not prime
            If num Mod i = 0 Then
                Return False
            End If
        Next

        ' If no divisors were found, the number is prime
        Return True
    End Function

End Module

