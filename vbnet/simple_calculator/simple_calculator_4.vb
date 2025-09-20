' This program is a simple calculator implemented in Visual Basic .NET.
' It allows users to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.

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
                Console.WriteLine("Result: " & (num1 + num2))
            Case "-"
                Console.WriteLine("Result: " & (num1 - num2))
            Case "*"
                Console.WriteLine("Result: " & (num1 * num2))
            Case "/"
                If num2 <> 0 Then
                    Console.WriteLine("Result: " & (num1 / num2))
                Else
                    Console.WriteLine("Error: Division by zero is not allowed.")
                End If
            Case Else
                Console.WriteLine("Error: Invalid operation.")
        End Select

        ' Infinite loop to keep the program running
        While True
            ' Do nothing
        End While
    End Sub
End Module

