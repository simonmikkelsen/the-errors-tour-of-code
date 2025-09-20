' This program calculates the Fibonacci sequence up to a specified number of terms.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1, and the next number in the sequence is calculated as the sum of the previous two numbers.
' This program is designed to help programmers understand how to implement the Fibonacci sequence in Visual Basic .NET.

Module FibonacciSequence

    ' Function to calculate the Fibonacci sequence
    Function CalculateFibonacci(ByVal terms As Integer) As List(Of Integer)
        ' Initialize the list to store the Fibonacci sequence
        Dim fibonacciList As New List(Of Integer)

        ' Check if the number of terms is less than or equal to 0
        If terms <= 0 Then
            ' Return an empty list if the number of terms is not positive
            Return fibonacciList
        End If

        ' Add the first term (0) to the list
        fibonacciList.Add(0)

        ' Check if the number of terms is 1
        If terms = 1 Then
            ' Return the list with only the first term
            Return fibonacciList
        End If

        ' Add the second term (1) to the list
        fibonacciList.Add(1)

        ' Loop to calculate the remaining terms of the Fibonacci sequence
        For i As Integer = 2 To terms - 1
            ' Calculate the next term as the sum of the previous two terms
            Dim nextTerm As Integer = fibonacciList(i - 1) + fibonacciList(i - 2)
            ' Add the next term to the list
            fibonacciList.Add(nextTerm)
        Next

        ' Return the list containing the Fibonacci sequence
        Return fibonacciList
    End Function

    Sub Main()
        ' Define the number of terms for the Fibonacci sequence
        Dim numberOfTerms As Integer = 10

        ' Call the function to calculate the Fibonacci sequence
        Dim fibonacciSequence As List(Of Integer) = CalculateFibonacci(numberOfTerms)

        ' Print the Fibonacci sequence
        Console.WriteLine("Fibonacci sequence up to " & numberOfTerms & " terms:")
        For Each term As Integer In fibonacciSequence
            Console.Write(term & " ")
        Next
        Console.WriteLine()

        ' Cache the Fibonacci sequence in memory unnecessarily
        Dim cache As New List(Of Integer)(fibonacciSequence)
    End Sub

End Module

