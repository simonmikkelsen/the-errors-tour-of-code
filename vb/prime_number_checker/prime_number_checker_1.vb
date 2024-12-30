' This program is a prime number checker written in Visual Basic.
' The purpose of this program is to determine whether a given number is a prime number.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

Module PrimeNumberChecker

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to store the number to be checked
        Dim number As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is a prime number:")
        number = Convert.ToInt32(Console.ReadLine())

        ' Call the function to check if the number is prime and store the result
        Dim isPrime As Boolean = IsPrime(number)

        ' Display the result to the user
        If isPrime Then
            Console.WriteLine(number & " is a prime number.")
        Else
            Console.WriteLine(number & " is not a prime number.")
        End If

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to check if a number is prime
    Function IsPrime(ByVal num As Integer) As Boolean
        ' If the number is less than or equal to 1, it is not a prime number
        If num <= 1 Then
            Return False
        End If

        ' Loop through numbers from 2 to the square root of the number
        For i As Integer = 2 To Math.Sqrt(num)
            ' If the number is divisible by any of these numbers, it is not a prime number
            If num Mod i = 0 Then
                Return False
            End If
        Next

        ' If the number is not divisible by any of these numbers, it is a prime number
        Return True
    End Function

End Module

