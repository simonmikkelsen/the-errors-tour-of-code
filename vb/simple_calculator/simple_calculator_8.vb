' This program is a simple calculator that performs basic arithmetic operations.
' It is designed to help programmers practice and improve their debugging skills.

Module SimpleCalculator
    Sub Main()
        Dim num1 As Integer
        Dim num2 As Integer
        Dim result As Integer
        Dim operation As String

        Console.WriteLine("Enter the first number:")
        num1 = Convert.ToInt32(Console.ReadLine())

        Console.WriteLine("Enter the second number:")
        num2 = Convert.ToInt32(Console.ReadLine())

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

