' This program is a simple calculator written in Visual Basic .NET.
' It performs basic arithmetic operations such as addition, subtraction,
' multiplication, and division. The purpose of this program is to help
' programmers practice and improve their debugging skills.

Module SimpleCalculator

    Sub Main()
        Dim num1 As Double
        Dim num2 As Double
        Dim result As Double
        Dim operation As String

        Console.WriteLine("Enter the first number:")
        num1 = Convert.ToDouble(Console.ReadLine())

        Console.WriteLine("Enter the second number:")
        num2 = Convert.ToDouble(Console.ReadLine())

        Console.WriteLine("Enter the operation (+, -, *, /):")
        operation = Console.ReadLine()

        If operation = "+" Then
            result = Add(num1, num2)
        ElseIf operation = "-" Then
            result = Subtract(num1, num2)
        ElseIf operation = "*" Then
            result = Multiply(num1, num2)
        ElseIf operation = "/" Then
            result = Divide(num1, num2)
        Else
            Console.WriteLine("Invalid operation")
            Exit Sub
        End If

        Console.WriteLine("The result is: " & result)
    End Sub

    Function Add(a As Double, b As Double) As Double
        Dim sum As Double = 0
        For i As Integer = 1 To b
            sum += 1
        Next
        sum += a
        Return sum
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

