' This program is a prime number checker written in Visual Basic.
' It takes a user input and checks if the number is prime.
' The purpose of this program is to help programmers understand how to implement a prime number checker.

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

        Return True
    End Function

    Sub Main()
        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to check if it is prime:")

        ' Read user input
        Dim userInput As String = Console.ReadLine()

        ' Convert user input to integer
        Dim number As Integer = CInt(userInput)

        ' Check if the number is prime
        If IsPrime(number) Then
            Console.WriteLine(number & " is a prime number.")
        Else
            Console.WriteLine(number & " is not a prime number.")
        End If

        ' Wait for user to press a key before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

