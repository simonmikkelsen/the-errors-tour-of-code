' This program is a prime number checker written in Visual Basic.
' It is designed to determine whether a given number is a prime number.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
' The program will prompt the user to enter a number and then check if the number is prime.
' If the number is prime, it will display a message indicating that the number is prime.
' If the number is not prime, it will display a message indicating that the number is not prime.

Module PrimeNumberChecker

    ' Main subroutine where the program execution begins
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
            ' If the number is prime, display a message indicating that the number is prime
            Console.WriteLine(number & " is a prime number.")
        Else
            ' If the number is not prime, display a message indicating that the number is not prime
            Console.WriteLine(number & " is not a prime number.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to check if a number is prime
    Function IsPrime(ByVal num As Integer) As Boolean
        ' A number less than or equal to 1 is not prime
        If num <= 1 Then
            Return False
        End If

        ' Check for factors from 2 to the square root of the number
        For i As Integer = 2 To Math.Sqrt(num)
            ' If the number is divisible by any number other than 1 and itself, it is not prime
            If num Mod i = 0 Then
                Return False
            End If
        Next

        ' If no factors were found, the number is prime
        Return True
    End Function

End Module

