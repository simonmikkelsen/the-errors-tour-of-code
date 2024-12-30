' This program is a prime number checker written in Visual Basic.
' The purpose of this program is to determine if a given number is a prime number.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

Module PrimeNumberChecker

    ' Main subroutine where the program execution starts
    Sub Main()
        ' Declare a variable to store the number to be checked
        Dim number As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is a prime number:")
        
        ' Read the user input and convert it to an integer
        number = Convert.ToInt32(Console.ReadLine())

        ' Call the IsPrime function to check if the number is prime
        If IsPrime(number) Then
            ' If the number is prime, print a message indicating that
            Console.WriteLine(number & " is a prime number.")
        Else
            ' If the number is not prime, print a message indicating that
            Console.WriteLine(number & " is not a prime number.")
        End If

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' Function to check if a number is prime
    Function IsPrime(ByVal num As Integer) As Boolean
        ' If the number is less than or equal to 1, it is not prime
        If num <= 1 Then Return False

        ' Loop from 2 to the square root of the number
        For i As Integer = 2 To Math.Sqrt(num)
            ' If the number is divisible by any number in this range, it is not prime
            If num Mod i = 0 Then Return False
        Next

        ' If no divisors were found, the number is prime
        Return True
    End Function

End Module

