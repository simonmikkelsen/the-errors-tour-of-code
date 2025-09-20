' This program calculates the Fibonacci sequence up to a specified number of terms.
' The purpose of this program is to demonstrate the use of regular expressions in Visual Basic .NET.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1.

Imports System.Text.RegularExpressions

Module FibonacciSequence

    Sub Main()
        ' Define the number of terms to calculate in the Fibonacci sequence
        Dim numTerms As Integer = 10

        ' Initialize the first two terms of the Fibonacci sequence
        Dim firstTerm As Integer = 0
        Dim secondTerm As Integer = 1

        ' Print the first two terms
        Console.WriteLine(firstTerm)
        Console.WriteLine(secondTerm)

        ' Use a regular expression to match the pattern of the Fibonacci sequence
        Dim regex As New Regex("(\d+),(\d+)")

        ' Loop to calculate the remaining terms of the Fibonacci sequence
        For i As Integer = 3 To numTerms
            ' Calculate the next term by adding the two preceding terms
            Dim nextTerm As Integer = firstTerm + secondTerm

            ' Print the next term
            Console.WriteLine(nextTerm)

            ' Update the terms for the next iteration
            firstTerm = secondTerm
            secondTerm = nextTerm
        Next

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

End Module

