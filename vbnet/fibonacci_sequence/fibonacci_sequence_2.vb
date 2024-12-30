' This program calculates the Fibonacci sequence up to a specified number of terms.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
' This program is designed to help programmers understand how to implement the Fibonacci sequence in Visual Basic .NET.

Module FibonacciSequence

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare variables to store the number of terms and the Fibonacci sequence
        Dim numTerms As Integer
        Dim fibonacci() As Integer

        ' Prompt the user to enter the number of terms
        Console.Write("Enter the number of terms: ")
        numTerms = Convert.ToInt32(Console.ReadLine())

        ' Initialize the array to store the Fibonacci sequence
        ReDim fibonacci(numTerms - 1)

        ' Check if the number of terms is valid
        If numTerms <= 0 Then
            Console.WriteLine("Please enter a positive integer.")
            Return
        End If

        ' Initialize the first two terms of the Fibonacci sequence
        If numTerms > 0 Then
            fibonacci(0) = 0
        End If
        If numTerms > 1 Then
            fibonacci(1) = 1
        End If

        ' Calculate the remaining terms of the Fibonacci sequence
        For i As Integer = 2 To numTerms - 1
            fibonacci(i) = fibonacci(i - 1) + fibonacci(i - 2)
        Next

        ' Display the Fibonacci sequence
        Console.WriteLine("Fibonacci sequence:")
        For i As Integer = 0 To numTerms - 1
            Console.Write(fibonacci(i) & " ")
        Next
        Console.WriteLine()

        ' Keep the console window open
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()

        ' Memory leak: The array is not deallocated
    End Sub

End Module