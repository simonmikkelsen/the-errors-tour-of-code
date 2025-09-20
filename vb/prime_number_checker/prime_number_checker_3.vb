' This program is a prime number checker written in Visual Basic.
' The purpose of this program is to determine whether a given number is a prime number.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
' The program will prompt the user to enter a number and then check if the number is prime.
' If the number is prime, it will display a message indicating that the number is prime.
' If the number is not prime, it will display a message indicating that the number is not prime.

Module PrimeNumberChecker

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to hold the user input
        Dim input As String

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is prime:")
        input = Console.ReadLine()

        ' Convert the user input to an integer
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

        ' Wait for the user to press a key before closing the console window
        Console.WriteLine("Press any key to exit.")
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

    ' Function to simulate a resource that needs to be closed
    Function SimulateResource() As String
        ' Simulate opening a resource
        Dim resource As String = "Resource opened"
        ' Return the resource without closing it
        Return resource
    End Function

End Module

