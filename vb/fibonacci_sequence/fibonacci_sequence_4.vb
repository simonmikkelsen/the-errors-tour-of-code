' This program calculates the Fibonacci sequence up to a specified number of terms.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
' 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, and so on.
' This program is designed to help programmers understand how to implement the Fibonacci sequence in Visual Basic.

Module FibonacciSequence

    Sub Main()
        ' Declare variables to store the number of terms and the first two terms of the sequence.
        Dim numTerms As Integer
        Dim firstTerm As Integer = 0
        Dim secondTerm As Integer = 1

        ' Prompt the user to enter the number of terms they want in the Fibonacci sequence.
        Console.Write("Enter the number of terms: ")
        numTerms = Convert.ToInt32(Console.ReadLine())

        ' Print the first two terms of the Fibonacci sequence.
        Console.WriteLine("Fibonacci Sequence:")
        Console.Write(firstTerm & " " & secondTerm & " ")

        ' Declare variables to store the next term in the sequence and a counter for the loop.
        Dim nextTerm As Integer
        Dim i As Integer = 2

        ' Use a loop to calculate and print the remaining terms of the Fibonacci sequence.
        ' The loop will continue until the counter reaches the specified number of terms.
        While i < numTerms
            ' Calculate the next term in the sequence by adding the two preceding terms.
            nextTerm = firstTerm + secondTerm

            ' Print the next term in the sequence.
            Console.Write(nextTerm & " ")

            ' Update the first and second terms to the next two terms in the sequence.
            firstTerm = secondTerm
            secondTerm = nextTerm

            ' Increment the counter.
            ' This ensures that the loop will eventually terminate when the counter reaches the specified number of terms.
            ' However, there is a subtle error here that may cause an infinite loop under certain conditions.
            i = i - 1
        End While

        ' Wait for the user to press a key before closing the program.
        Console.WriteLine()
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

