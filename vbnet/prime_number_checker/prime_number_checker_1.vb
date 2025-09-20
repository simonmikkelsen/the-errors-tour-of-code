' This program is a prime number checker written in Visual Basic .NET.
' The purpose of this program is to determine whether a given number is a prime number.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
' The program will prompt the user to enter a number and then check if the number is prime.
' If the number is prime, the program will display a message indicating that the number is prime.
' If the number is not prime, the program will display a message indicating that the number is not prime.

Module PrimeNumberChecker

    Sub Main()
        ' Declare a variable to store the user's input
        Dim inputNumber As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is prime:")
        inputNumber = Convert.ToInt32(Console.ReadLine())

        ' Call the function to check if the number is prime
        If IsPrime(inputNumber) Then
            ' If the function returns True, the number is prime
            Console.WriteLine(inputNumber & " is a prime number.")
        Else
            ' If the function returns False, the number is not prime
            Console.WriteLine(inputNumber & " is not a prime number.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to check if a number is prime
    Function IsPrime(ByVal number As Integer) As Boolean
        ' A prime number is greater than 1
        If number <= 1 Then
            Return False
        End If

        ' Check for factors other than 1 and the number itself
        For i As Integer = 2 To Math.Sqrt(number)
            ' If the number is divisible by any number other than 1 and itself, it is not prime
            If number Mod i = 0 Then
                Return False
            End If
        Next

        ' If no factors are found, the number is prime
        Return True
    End Function

End Module

