' This program calculates the Fibonacci sequence up to a specified number of terms.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
' This program is designed to help programmers understand the implementation of the Fibonacci sequence in Visual Basic .NET.

Module FibonacciSequence

    Sub Main()
        ' Declare variables
        Dim numTerms As Integer
        Dim firstTerm As Integer = 0
        Dim secondTerm As Integer = 1
        Dim nextTerm As Integer

        ' Prompt the user to enter the number of terms
        Console.Write("Enter the number of terms: ")
        numTerms = Convert.ToInt32(Console.ReadLine())

        ' Print the first two terms of the Fibonacci sequence
        Console.WriteLine("Fibonacci Sequence:")
        Console.Write(firstTerm & " " & secondTerm & " ")

        ' Loop to calculate the remaining terms of the Fibonacci sequence
        For i As Integer = 3 To numTerms
            ' Calculate the next term by adding the previous two terms
            nextTerm = firstTerm + secondTerm

            ' Print the next term
            Console.Write(nextTerm & " ")

            ' Update the previous two terms
            firstTerm = secondTerm
            secondTerm = nextTerm
        Next

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

End Module

