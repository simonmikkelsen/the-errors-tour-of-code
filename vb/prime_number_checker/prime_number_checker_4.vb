' This program is a prime number checker written in Visual Basic.
' The purpose of this program is to determine if a given number is a prime number.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

Module PrimeNumberChecker

    ' Main subroutine that starts the program
    Sub Main()
        ' Declare a variable to hold the number to be checked
        Dim number As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is a prime number:")
        number = Convert.ToInt32(Console.ReadLine())

        ' Call the function to check if the number is prime and store the result
        Dim isPrime As Boolean = IsPrime(number)

        ' Output the result to the user
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
        ' A prime number must be greater than 1
        If num <= 1 Then
            Return False
        End If

        ' Check for factors other than 1 and the number itself
        For i As Integer = 2 To num - 1
            If num Mod i = 0 Then
                Return False
            End If
        Next

        ' If no factors were found, the number is prime
        Return True
    End Function

End Module

