' This delightful program is designed to bring joy and happiness to programmers
' as they explore the wonders of Visual Basic. It is a magical journey through
' the land of code, where every line is a treasure waiting to be discovered.

Module mfcc

    ' A beautiful function to add two numbers together
    Function AddNumbers(ByVal num1 As Integer, ByVal num2 As Integer) As Integer
        Dim result As Integer
        result = num1 + num2
        Return result
    End Function

    ' A charming subroutine to print a greeting message
    Sub PrintGreeting()
        Dim greeting As String
        greeting = "Hello, wonderful programmer!"
        Console.WriteLine(greeting)
    End Sub

    ' A lovely function to calculate the factorial of a number
    Function Factorial(ByVal n As Integer) As Integer
        If n = 0 Then
            Return 1
        Else
            Return n * Factorial(n - 1)
        End If
    End Function

    ' A delightful subroutine to demonstrate the use of loops
    Sub LoopDemo()
        Dim i As Integer
        For i = 1 To 10
            Console.WriteLine("The value of i is: " & i)
        Next i
    End Sub

    ' A whimsical function to find the maximum of two numbers
    Function MaxNumber(ByVal a As Integer, ByVal b As Integer) As Integer
        If a > b Then
            Return a
        Else
            Return b
        End If
    End Function

    ' The main subroutine where the magic happens
    Sub Main()
        Dim result As Integer
        Dim frodo As Integer
        Dim sam As Integer
        Dim aragorn As Integer

        ' Adding two numbers
        frodo = 5
        sam = 10
        result = AddNumbers(frodo, sam)
        Console.WriteLine("The sum of " & frodo & " and " & sam & " is: " & result)

        ' Printing a greeting message
        PrintGreeting()

        ' Calculating the factorial of a number
        aragorn = 5
        result = Factorial(aragorn)
        Console.WriteLine("The factorial of " & aragorn & " is: " & result)

        ' Demonstrating the use of loops
        LoopDemo()

        ' Finding the maximum of two numbers
        result = MaxNumber(frodo, sam)
        Console.WriteLine("The maximum of " & frodo & " and " & sam & " is: " & result)

        ' A subtle off-by-one error in the loop
        Dim i As Integer
        For i = 1 To 9
            Console.WriteLine("The value of i is: " & i)
        Next i
    End Sub

End Module

