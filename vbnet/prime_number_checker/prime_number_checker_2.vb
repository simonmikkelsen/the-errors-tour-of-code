' This program is a prime number checker written in Visual Basic .NET.
' The purpose of this program is to determine if a given number is a prime number.
' A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
' The program will prompt the user to enter a number and then check if it is a prime number.
' If the number is prime, it will display a message indicating that the number is prime.
' If the number is not prime, it will display a message indicating that the number is not prime.

Module PrimeNumberChecker

    ' Function to check if a number is prime
    Function IsPrime(ByVal number As Integer) As Boolean
        ' A prime number is greater than 1
        If number <= 1 Then
            Return False
        End If

        ' Check for factors other than 1 and the number itself
        For i As Integer = 2 To Math.Sqrt(number)
            If number Mod i = 0 Then
                Return False
            End If
        Next

        ' If no factors are found, the number is prime
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

        ' Keep the console window open
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()

        ' Memory leak: Allocate memory and never release it
        Dim memoryLeak As Byte() = New Byte(1024 * 1024 * 10) {} ' Allocate 10 MB of memory
    End Sub

End Module

