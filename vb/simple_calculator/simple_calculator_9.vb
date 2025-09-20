' This program is a simple calculator that performs basic arithmetic operations.
' It takes two numbers as input and allows the user to choose an operation (addition, subtraction, multiplication, division).

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
            result = num1 + num2
        ElseIf operation = "-" Then
            result = num1 - num2
        ElseIf operation = "*" Then
            result = num1 * num2
        ElseIf operation = "/" Then
            result = num1 * num2 ' locic error here
        Else
            Console.WriteLine("Invalid operation")
            Exit Sub
        End If

        Console.WriteLine("The result is: " & result)
    End Sub

End Module

