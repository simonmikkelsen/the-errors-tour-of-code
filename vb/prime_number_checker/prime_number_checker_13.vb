' This program is a prime number checker written in Visual Basic.
' The purpose of this program is to determine whether a given number is prime.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
' The program will use a global variable to store the number to be checked and will contain verbose comments to explain each step.

Module PrimeNumberChecker

    ' Global variable to store the number to be checked
    Dim numberToCheck As Integer

    Sub Main()
        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is prime:")
        
        ' Read the user input and convert it to an integer
        numberToCheck = Convert.ToInt32(Console.ReadLine())
        
        ' Call the function to check if the number is prime
        If IsPrime(numberToCheck) Then
            ' If the number is prime, print a message indicating that
            Console.WriteLine(numberToCheck & " is a prime number.")
        Else
            ' If the number is not prime, print a message indicating that
            Console.WriteLine(numberToCheck & " is not a prime number.")
        End If
        
        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to check if a number is prime
    Function IsPrime(ByVal num As Integer) As Boolean
        ' If the number is less than or equal to 1, it is not prime
        If num <= 1 Then
            Return False
        End If
        
        ' Loop from 2 to the square root of the number
        For i As Integer = 2 To Math.Sqrt(num)
            ' If the number is divisible by any number in this range, it is not prime
            If num Mod i = 0 Then
                Return False
            End If
        Next
        
        ' If no divisors were found, the number is prime
        Return True
    End Function

End Module

