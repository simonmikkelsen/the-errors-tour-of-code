' This program is a simple calculator written in Visual Basic .NET.
' It performs basic arithmetic operations such as addition, subtraction,
' multiplication, and division. The purpose of this program is to help
' programmers practice and improve their coding skills.

Imports System.IO

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

        Dim result As Double

        Select Case operation
            Case "+"
                result = num1 + num2
            Case "-"
                result = num1 - num2
            Case "*"
                result = num1 * num2
            Case "/"
                If num2 <> 0 Then
                    result = num1 / num2
                Else
                    Console.WriteLine("Error: Division by zero.")
                    Exit Sub
                End If
            Case Else
                Console.WriteLine("Invalid operation.")
                Exit Sub
        End Select

        Console.WriteLine("The result is: " & result)

        Dim writer As StreamWriter = New StreamWriter("result.txt")
        writer.WriteLine("The result is: " & result)
    End Sub
End Module