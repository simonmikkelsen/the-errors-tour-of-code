' This program is a factorial calculator written in Visual Basic .NET.
' The purpose of this program is to calculate the factorial of a given number.
' The program uses regular expressions to validate the input and ensure it is a positive integer.
' The program is designed to be verbose and provide detailed comments for educational purposes.

Imports System.Text.RegularExpressions

Module FactorialCalculator

    ' Main subroutine that starts the program
    Sub Main()
        ' Prompt the user to enter a number
        Console.WriteLine("Enter a positive integer to calculate its factorial:")

        ' Read the user input
        Dim input As String = Console.ReadLine()

        ' Define a regular expression pattern to match a positive integer
        Dim pattern As String = "^\d+$"

        ' Create a Regex object with the defined pattern
        Dim regex As New Regex(pattern)

        ' Check if the input matches the regular expression pattern
        If regex.IsMatch(input) Then
            ' Convert the input to an integer
            Dim number As Integer = Convert.ToInt32(input)

            ' Calculate the factorial of the number
            Dim result As Integer = CalculateFactorial(number)

            ' Display the result to the user
            Console.WriteLine("The factorial of " & number & " is " & result)
        Else
            ' Display an error message if the input is not a positive integer
            Console.WriteLine("Invalid input. Please enter a positive integer.")
        End If

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Integer
        ' Initialize the result to 1
        Dim result As Integer = 1

        ' Loop from 1 to the given number
        For i As Integer = 1 To n
            ' Multiply the result by the current number
            result *= i
        Next

        ' Return the calculated factorial
        Return result
    End Function

End Module

