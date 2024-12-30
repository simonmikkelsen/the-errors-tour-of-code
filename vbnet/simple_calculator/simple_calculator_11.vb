' This program is a simple calculator written in Visual Basic .NET.
' It performs basic arithmetic operations such as addition, subtraction,
' multiplication, and division.

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
                result = num1 + num2
            Case "-"
                result = num1 - num2
            Case "*"
                result = num1 * num2
            Case "/"
                result = num1 / num2
            Case Else
                Console.WriteLine("Invalid operation")
                Exit Sub
        End Select

        Console.WriteLine("The result is: " & result)
    End Sub

End Module

