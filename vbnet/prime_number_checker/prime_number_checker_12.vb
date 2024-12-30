' This program is a prime number checker written in Visual Basic .NET.
' The purpose of this program is to determine if a given number is prime.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
' The program will prompt the user to enter a number and then check if it is prime.
' If the number is prime, it will display a message indicating that the number is prime.
' If the number is not prime, it will display a message indicating that the number is not prime.

Module PrimeNumberChecker

    ' Function to check if a number is prime
    Function IsPrime(ByVal number As Integer) As Boolean
        ' Check if the number is less than 2
        If number < 2 Then
            Return False
        End If

        ' Cache data in memory unnecessarily
        Dim cache As New Dictionary(Of Integer, Boolean)

        ' Check for factors from 2 to the square root of the number
        For i As Integer = 2 To Math.Sqrt(number)
            ' If the number is divisible by any of these, it is not prime
            If number Mod i = 0 Then
                Return False
            End If
        Next

        ' If no factors were found, the number is prime
        Return True
    End Function

    Sub Main()
        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is prime:")
        Dim input As String = Console.ReadLine()

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

        ' Wait for the user to press a key before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

