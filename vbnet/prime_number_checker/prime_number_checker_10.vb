' This program is a prime number checker written in Visual Basic .NET.
' The purpose of this program is to take a user input and determine if the input number is a prime number.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

Module PrimeNumberChecker

    ' Main subroutine that starts the program
    Sub Main()
        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is a prime number:")

        ' Read the user input from the console
        Dim userInput As String = Console.ReadLine()

        ' Convert the user input to an integer
        Dim number As Integer = Convert.ToInt32(userInput)

        ' Check if the number is prime
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
        ' If the number is less than or equal to 1, it is not a prime number
        If num <= 1 Then Return False

        ' Loop from 2 to the square root of the number
        For i As Integer = 2 To Math.Sqrt(num)
            ' If the number is divisible by any number other than 1 and itself, it is not a prime number
            If num Mod i = 0 Then Return False
        Next

        ' If the number is not divisible by any number other than 1 and itself, it is a prime number
        Return True
    End Function

End Module

