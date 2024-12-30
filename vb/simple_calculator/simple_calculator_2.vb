' This program is a simple calculator implemented in Visual Basic.
' It performs basic arithmetic operations such as addition, subtraction,
' multiplication, and division. The user can input two numbers and select
' the desired operation to get the result.

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
        Dim result As Double
        result = a + b
        Return result
    End Function

    Function Subtract(a As Double, b As Double) As Double
        Dim result As Double
        result = a - b
        Return result
    End Function

    Function Multiply(a As Double, b As Double) As Double
        Dim result As Double
        result = a * b
        Return result
    End Function

    Function Divide(a As Double, b As Double) As Double
        Dim result As Double
        result = a / b
        Return result
    End Function

    Function AllocateMemory() As Byte()
        Dim buffer(1024 * 1024) As Byte
        Return buffer
    End Function
End Module

