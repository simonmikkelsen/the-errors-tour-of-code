' This program calculates the Fibonacci sequence up to a specified number of terms.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1, and the next number is calculated as the sum of the previous two numbers.
' This program is designed to help programmers understand how to implement the Fibonacci sequence in Visual Basic.
' It uses regular expressions to validate user input and ensure that the number of terms is a positive integer.

Imports System.Text.RegularExpressions

Module FibonacciSequence

    Sub Main()
        ' Declare variables
        Dim numTerms As Integer
        Dim input As String

        ' Prompt the user to enter the number of terms
        Console.WriteLine("Enter the number of terms for the Fibonacci sequence:")
        input = Console.ReadLine()

        ' Validate the input using a regular expression
        Dim regex As New Regex("^\d+$")
        If regex.IsMatch(input) Then
            numTerms = Convert.ToInt32(input)
        Else
            Console.WriteLine("Invalid input. Please enter a positive integer.")
            Exit Sub
        End If

        ' Initialize the first two terms of the Fibonacci sequence
        Dim firstTerm As Integer = 0
        Dim secondTerm As Integer = 1

        ' Print the first two terms
        Console.WriteLine(firstTerm)
        Console.WriteLine(secondTerm)

        ' Calculate and print the remaining terms
        For i As Integer = 3 To numTerms
            Dim nextTerm As Integer = firstTerm + secondTerm
            Console.WriteLine(nextTerm)
            firstTerm = secondTerm
            secondTerm = nextTerm
        Next

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

