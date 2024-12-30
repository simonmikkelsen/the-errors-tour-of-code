' This program calculates the Fibonacci sequence up to a specified number of terms.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
' This program is designed to help programmers understand the implementation of the Fibonacci sequence in Visual Basic .NET.

Module FibonacciSequence

    Sub Main()
        ' Declare variables to hold the number of terms and the current Fibonacci numbers
        Dim numTerms As Integer
        Dim firstNum As Integer = 0
        Dim secondNum As Integer = 1
        Dim nextNum As Integer

        ' Prompt the user to enter the number of terms for the Fibonacci sequence
        Console.Write("Enter the number of terms: ")
        numTerms = Convert.ToInt32(Console.ReadLine())

        ' Print the first two terms of the Fibonacci sequence
        Console.WriteLine("Fibonacci Sequence:")
        Console.Write(firstNum & " " & secondNum & " ")

        ' Loop to calculate and print the remaining terms of the Fibonacci sequence
        For i As Integer = 3 To numTerms
            ' Calculate the next term in the sequence
            nextNum = firstNum + secondNum

            ' Print the next term
            Console.Write(nextNum & " ")

            ' Update the previous two terms
            firstNum = secondNum
            secondNum = nextNum
        Next

        ' Wait for the user to press a key before closing the console window
        Console.WriteLine()
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

