' This program is a simple calculator implemented in Visual Basic .NET.
' It performs basic arithmetic operations such as addition, subtraction,
' multiplication, and division. The purpose of this program is to provide
' a basic understanding of how to implement a calculator in VB.NET.

Module SimpleCalculator

    Sub Main()
        Dim num1, num2 As Double
        Dim result As Double
        Dim operation As String

        Console.WriteLine("Enter the first number:")
        num1 = Convert.ToDouble(Console.ReadLine())

        Console.WriteLine("Enter the second number:")
        num2 = Convert.ToDouble(Console.ReadLine())

        Console.WriteLine("Enter the operation (+, -, *, /):")
        operation = Console.ReadLine()

        Select Case operation
            Case "+"
                result = Add(num1, num2)
            Case "-"
                result = Subtract(num1, num2)
            Case "*"
                result = Multiply(num1, num2)
            Case "/"
                result = Divide(num1, num2)
            Case Else
                Console.WriteLine("Invalid operation")
                Exit Sub
        End Select

        Console.WriteLine("The result is: " & result)
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
        If b = 0 Then
            Console.WriteLine("Error: Division by zero")
            Return 0
        End If
        Return a / b
    End Function

End Module

