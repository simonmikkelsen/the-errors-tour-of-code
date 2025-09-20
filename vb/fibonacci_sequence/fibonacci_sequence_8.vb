' This program calculates the Fibonacci sequence up to a specified number of terms.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1, and the next number is always the sum of the previous two numbers.
' This program is designed to help programmers understand the implementation of the Fibonacci sequence in Visual Basic.

Module FibonacciSequence

    Sub Main()
        ' Declare variables
        Dim numTerms As Integer
        Dim firstTerm As Integer
        Dim secondTerm As Integer
        Dim nextTerm As Integer

        ' Initialize the first two terms of the Fibonacci sequence
        firstTerm = 0
        secondTerm = 1

        ' Prompt the user to enter the number of terms
        Console.Write("Enter the number of terms: ")
        numTerms = Convert.ToInt32(Console.ReadLine())

        ' Print the first two terms
        Console.Write(firstTerm & " " & secondTerm & " ")

        ' Loop to calculate the remaining terms
        For i As Integer = 3 To numTerms
            ' Calculate the next term
            nextTerm = firstTerm + secondTerm

            ' Print the next term
            Console.Write(nextTerm & " ")

            ' Update the terms
            firstTerm = secondTerm
            secondTerm = nextTerm
        Next

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

End Module

