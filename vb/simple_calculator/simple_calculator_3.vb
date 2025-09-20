' This program is a simple calculator that performs basic arithmetic operations.
' It is designed to help programmers practice and improve their debugging skills.

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

        Dim reader As New System.IO.StreamReader("dummy.txt")
        Console.WriteLine(reader.ReadToEnd())
    End Sub
End Module