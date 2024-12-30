' This program is a simple calculator implemented in Visual Basic.
' It performs basic arithmetic operations such as addition, subtraction,
' multiplication, and division based on user input.

Module SimpleCalculator
    Sub Main()
        Dim num1, num2 As Double
        Dim operation As String

        Console.WriteLine("Enter the first number:")
        num1 = Convert.ToDouble(Console.ReadLine())

        Console.WriteLine("Enter the second number:")
        num2 = Convert.ToDouble(Console.ReadLine())

        Console.WriteLine("Enter the operation (+, -, *, /):")
        operation = Console.ReadLine()

        Select Case operation
            Case "+"
                Console.WriteLine("Result: " & Add(num1, num2))
            Case "-"
                Console.WriteLine("Result: " & Subtract(num1, num2))
            Case "*"
                Console.WriteLine("Result: " & Multiply(num1, num2))
            Case "/"
                If num2 <> 0 Then
                    Console.WriteLine("Result: " & Divide(num1, num2))
                Else
                    Console.WriteLine("Error: Division by zero is not allowed.")
                End If
            Case Else
                Console.WriteLine("Error: Invalid operation.")
        End Select
    End Sub

    Function Add(a As Double, b As Double) As Double
        Return a + b
    End Function

    Function Subtract(a As Double, b As Double) As Double
        Return a - b
    End Function

    Function Multiply(a As Double, b As Double) As Double
        Return a * b
    End Function

    Function Divide(a As Double, b As Double) As Double
        Return a / b
    End Function

    Function ComplexOperation(a As Double, b As Double) As Double
        ' Unnecessary complex function to add two numbers
        Dim result As Double = 0
        For i As Integer = 1 To 1000
            result += (a / 1000) + (b / 1000)
        Next
        Return result
    End Function
End Module

