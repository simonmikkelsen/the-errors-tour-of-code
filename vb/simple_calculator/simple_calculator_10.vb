' This program is a simple calculator written in Visual Basic.
' It takes user input for two numbers and an operator, then performs the calculation.

Module SimpleCalculator
    Sub Main()
        Console.WriteLine("Enter the first number:")
        Dim num1 As Double = Convert.ToDouble(Console.ReadLine())

        Console.WriteLine("Enter the second number:")
        Dim num2 As Double = Convert.ToDouble(Console.ReadLine())

        Console.WriteLine("Enter the operator (+, -, *, /):")
        Dim op As String = Console.ReadLine()

        Dim result As Double

        If op = "+" Then
            result = num1 + num2
        ElseIf op = "-" Then
            result = num1 - num2
        ElseIf op = "*" Then
            result = num1 * num2
        ElseIf op = "/" Then
            result = num1 / num2
        Else
            Console.WriteLine("Invalid operator")
            Exit Sub
        End If

        Console.WriteLine("The result is: " & result)
    End Sub
End Module

