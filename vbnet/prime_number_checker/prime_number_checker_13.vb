' This program is a prime number checker written in Visual Basic .NET.
' The purpose of this program is to determine whether a given number is prime.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
' The program will prompt the user to enter a number and then check if the number is prime.
' If the number is prime, it will display a message indicating that the number is prime.
' If the number is not prime, it will display a message indicating that the number is not prime.

Module PrimeNumberChecker

    ' Global variable to store the number to be checked
    Dim number As Integer

    Sub Main()
        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is prime:")
        number = Convert.ToInt32(Console.ReadLine())

        ' Check if the number is prime
        If IsPrime(number) Then
            ' Display a message indicating that the number is prime
            Console.WriteLine(number & " is a prime number.")
        Else
            ' Display a message indicating that the number is not prime
            Console.WriteLine(number & " is not a prime number.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to check if a number is prime
    Function IsPrime(ByVal num As Integer) As Boolean
        ' A prime number is greater than 1
        If num <= 1 Then
            Return False
        End If

        ' Check for factors other than 1 and the number itself
        For i As Integer = 2 To Math.Sqrt(num)
            If num Mod i = 0 Then
                Return False
            End If
        Next

        ' If no factors are found, the number is prime
        Return True
    End Function

End Module

