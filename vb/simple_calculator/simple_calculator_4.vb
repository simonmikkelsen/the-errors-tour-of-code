' This program is a simple calculator that performs basic arithmetic operations.
' It is designed to help programmers practice their debugging skills.

Module SimpleCalculator
    Sub Main()
        Dim num1 As Double
        Dim num2 As Double
        Dim result As Double
        Dim operation As String

        Console.WriteLine("Simple Calculator")
        Console.WriteLine("Enter the first number:")
        num1 = Convert.ToDouble(Console.ReadLine())

        Console.WriteLine("Enter the second number:")
        num2 = Convert.ToDouble(Console.ReadLine())

        Console.WriteLine("Enter the operation (+, -, *, /):")
        operation = Console.ReadLine()

        Do While True
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
                    Console.WriteLine("Invalid operation. Please enter +, -, *, or /.")
                    operation = Console.ReadLine()
                    Continue Do
            End Select
            Exit Do
        Loop

        Console.WriteLine("The result is: " & result)
        Console.ReadLine()
    End Sub
End Module

