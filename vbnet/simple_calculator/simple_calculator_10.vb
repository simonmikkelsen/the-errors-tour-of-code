' This program is a simple calculator written in Visual Basic .NET.
' It allows users to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.

Module SimpleCalculator
    Sub Main()
        Console.WriteLine("Simple Calculator")
        Console.WriteLine("Enter the first number:")
        Dim num1 As Double = Convert.ToDouble(Console.ReadLine())

        Console.WriteLine("Enter an operator (+, -, *, /):")
        Dim op As String = Console.ReadLine()

        Console.WriteLine("Enter the second number:")
        Dim num2 As Double = Convert.ToDouble(Console.ReadLine())

        Dim result As Double

        Select Case op
            Case "+"
                result = num1 + num2
            Case "-"
                result = num1 - num2
            Case "*"
                result = num1 * num2
            Case "/"
                result = num1 / num2
            Case Else
                Console.WriteLine("Invalid operator")
                Exit Sub
        End Select

        Console.WriteLine("The result is: " & result)
    End Sub
End Module

