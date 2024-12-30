' This program is a factorial calculator written in Visual Basic .NET.
' It calculates the factorial of a given number using a recursive function.
' The purpose of this program is to demonstrate basic programming concepts
' such as recursion, input/output operations, and error handling.

Imports System.IO

Module FactorialCalculator

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user input
        Dim input As String

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")
        input = Console.ReadLine()

        ' Convert the input to an integer
        Dim number As Integer
        If Integer.TryParse(input, number) Then
            ' Calculate the factorial of the number
            Dim result As Long = Factorial(number)

            ' Display the result
            Console.WriteLine("The factorial of " & number & " is " & result)
        Else
            ' Display an error message if the input is not a valid integer
            Console.WriteLine("Invalid input. Please enter a valid integer.")
        End If

        ' Open a file to write the result (this is where the resource leak occurs)
        Dim writer As StreamWriter = New StreamWriter("result.txt")
        writer.WriteLine("The factorial of " & number & " is " & result)
        ' Note: The StreamWriter is not closed, causing a resource leak

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Recursive function to calculate the factorial of a number
    Function Factorial(ByVal n As Integer) As Long
        ' Base case: factorial of 0 or 1 is 1
        If n = 0 Or n = 1 Then
            Return 1
        Else
            ' Recursive case: n * factorial of (n - 1)
            Return n * Factorial(n - 1)
        End If
    End Function

End Module

