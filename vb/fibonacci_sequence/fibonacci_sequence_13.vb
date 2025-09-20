' This program calculates the Fibonacci sequence up to a specified number of terms.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1, and the next number in the sequence is calculated as the sum of the previous two numbers.
' This program uses a global variable to store the current term in the sequence.

Module FibonacciSequence

    ' Global variable to store the current term in the Fibonacci sequence
    Dim currentTerm As Integer

    Sub Main()
        ' Declare variables to store the number of terms and the previous two terms in the sequence
        Dim numTerms As Integer
        Dim firstTerm As Integer = 0
        Dim secondTerm As Integer = 1

        ' Prompt the user to enter the number of terms
        Console.Write("Enter the number of terms: ")
        numTerms = Convert.ToInt32(Console.ReadLine())

        ' Print the first two terms of the sequence
        Console.WriteLine("Fibonacci Sequence:")
        Console.WriteLine(firstTerm)
        Console.WriteLine(secondTerm)

        ' Loop to calculate and print the remaining terms in the sequence
        For i As Integer = 3 To numTerms
            ' Calculate the current term as the sum of the previous two terms
            currentTerm = firstTerm + secondTerm

            ' Print the current term
            Console.WriteLine(currentTerm)

            ' Update the previous two terms for the next iteration
            firstTerm = secondTerm
            secondTerm = currentTerm
        Next

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

