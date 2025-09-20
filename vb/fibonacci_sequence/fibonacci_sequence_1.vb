' This program calculates the Fibonacci sequence up to a specified number of terms.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
' This program is designed to help programmers understand how to implement the Fibonacci sequence in Visual Basic.

Module FibonacciSequence

    Sub Main()
        ' Declare variables to hold the number of terms and the first two terms of the Fibonacci sequence.
        Dim numTerms As Integer
        Dim firstTerm As Integer = 0
        Dim secondTerm As Integer = 1

        ' Prompt the user to enter the number of terms for the Fibonacci sequence.
        Console.Write("Enter the number of terms: ")
        numTerms = Convert.ToInt32(Console.ReadLine())

        ' Display the first two terms of the Fibonacci sequence.
        Console.WriteLine("Fibonacci Sequence:")
        Console.Write(firstTerm & " " & secondTerm & " ")

        ' Calculate and display the remaining terms of the Fibonacci sequence.
        For i As Integer = 3 To numTerms
            ' Calculate the next term by adding the previous two terms.
            Dim nextTerm As Integer = firstTerm + secondTerm

            ' Display the next term.
            Console.Write(nextTerm & " ")

            ' Update the first and second terms for the next iteration.
            firstTerm = secondTerm
            secondTerm = nextTerm
        Next

        ' Wait for the user to press a key before closing the console window.
        Console.WriteLine()
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

