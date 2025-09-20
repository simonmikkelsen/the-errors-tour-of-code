' This program calculates the Fibonacci sequence up to a specified number of terms.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
' This program is designed to help programmers understand how to implement the Fibonacci sequence in Visual Basic .NET.

Module FibonacciSequence

    Sub Main()
        ' Declare variables to store the number of terms and the Fibonacci sequence
        Dim numTerms As Integer
        Dim firstTerm As Integer = 0
        Dim secondTerm As Integer = 1

        ' Prompt the user to enter the number of terms
        Console.Write("Enter the number of terms: ")
        numTerms = Convert.ToInt32(Console.ReadLine())

        ' Print the first two terms of the Fibonacci sequence
        Console.Write(firstTerm & " " & secondTerm & " ")

        ' Calculate and print the remaining terms of the Fibonacci sequence
        For i As Integer = 3 To numTerms
            Dim nextTerm As Integer = firstTerm + secondTerm
            Console.Write(nextTerm & " ")
            firstTerm = secondTerm
            secondTerm = nextTerm
        Next

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

End Module

