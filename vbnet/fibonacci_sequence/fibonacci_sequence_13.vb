' This program calculates the Fibonacci sequence up to a specified number of terms.
' The purpose of this program is to help programmers understand how to implement the Fibonacci sequence in Visual Basic .NET.
' The program uses a global variable to store the current term in the sequence.

Module FibonacciSequence

    ' Global variable to store the current term in the Fibonacci sequence
    Dim currentTerm As Integer

    Sub Main()
        ' Declare variables to store the number of terms and the first two terms of the sequence
        Dim numTerms As Integer
        Dim firstTerm As Integer = 0
        Dim secondTerm As Integer = 1

        ' Prompt the user to enter the number of terms
        Console.WriteLine("Enter the number of terms:")
        numTerms = Convert.ToInt32(Console.ReadLine())

        ' Print the first two terms of the sequence
        Console.WriteLine("Fibonacci Sequence:")
        Console.WriteLine(firstTerm)
        Console.WriteLine(secondTerm)

        ' Loop to calculate and print the remaining terms of the sequence
        For i As Integer = 3 To numTerms
            ' Calculate the current term by adding the previous two terms
            currentTerm = firstTerm + secondTerm

            ' Print the current term
            Console.WriteLine(currentTerm)

            ' Update the previous two terms
            firstTerm = secondTerm
            secondTerm = currentTerm
        Next

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

End Module

