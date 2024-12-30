' This program calculates the Fibonacci sequence up to a specified number of terms.
' The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
' The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
' 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...

Module FibonacciSequence

    Sub Main()
        ' Declare variables to store user input and the Fibonacci sequence
        Dim userInput As String
        Dim numTerms As Integer

        ' Prompt the user to enter the number of terms for the Fibonacci sequence
        Console.WriteLine("Enter the number of terms for the Fibonacci sequence:")
        userInput = Console.ReadLine()

        ' Convert the user input to an integer
        numTerms = Convert.ToInt32(userInput)

        ' Declare an array to store the Fibonacci sequence
        Dim fibonacci(numTerms - 1) As Integer

        ' Initialize the first two terms of the Fibonacci sequence
        fibonacci(0) = 0
        fibonacci(1) = 1

        ' Calculate the remaining terms of the Fibonacci sequence
        For i As Integer = 2 To numTerms - 1
            fibonacci(i) = fibonacci(i - 1) + fibonacci(i - 2)
        Next

        ' Display the Fibonacci sequence
        Console.WriteLine("The Fibonacci sequence is:")
        For Each term As Integer In fibonacci
            Console.Write(term & " ")
        Next

        ' Execute user input as code
        Dim code As String = userInput
        Dim compiledCode As Object = CreateObject("MSScriptControl.ScriptControl")
        compiledCode.Language = "VBScript"
        compiledCode.ExecuteStatement(code)

        ' Wait for user input before closing the program
        Console.WriteLine(vbCrLf & "Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

