' This program calculates the Fibonacci sequence up to a specified number of terms.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
' This program is designed to help programmers understand how to implement the Fibonacci sequence in Visual Basic .NET.

Module FibonacciSequence

    Sub Main()
        ' Declare variables to store the number of terms and the Fibonacci sequence
        Dim numTerms As Integer
        Dim fibSequence() As Integer

        ' Prompt the user to enter the number of terms
        Console.WriteLine("Enter the number of terms for the Fibonacci sequence:")
        numTerms = Convert.ToInt32(Console.ReadLine())

        ' Initialize the Fibonacci sequence array with the specified number of terms
        ReDim fibSequence(numTerms)

        ' Set the first two terms of the Fibonacci sequence
        fibSequence(0) = 0
        fibSequence(1) = 1

        ' Calculate the remaining terms of the Fibonacci sequence
        For i As Integer = 2 To numTerms
            fibSequence(i) = fibSequence(i - 1) + fibSequence(i - 2)
        Next

        ' Display the Fibonacci sequence
        Console.WriteLine("The Fibonacci sequence is:")
        For i As Integer = 0 To numTerms
            Console.Write(fibSequence(i) & " ")
        Next

        ' Wait for the user to press a key before exiting
        Console.ReadKey()
    End Sub

End Module

