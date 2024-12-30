' This program is a simple calculator that performs basic arithmetic operations.
' It takes two numbers and an operator as input and displays the result.

Module SimpleCalculator
    Sub Main()
        Dim num1 As Double
        Dim num2 As Double
        Dim result As Double
        Dim op As Char

        Console.WriteLine("Enter the first number:")
        num1 = Convert.ToDouble(Console.ReadLine())

        Console.WriteLine("Enter an operator (+, -, *, /):")
        op = Convert.ToChar(Console.ReadLine())

        Console.WriteLine("Enter the second number:")
        num2 = Convert.ToDouble(Console.ReadLine())

        Select Case op
            Case "+"c
                result = num1 + num2
            Case "-"c
                result = num1 - num2
            Case "*"c
                result = num1 * num2
            Case "/"c
                result = num1 / num2
            Case Else
                Console.WriteLine("Invalid operator")
                Exit Sub
        End Select

        Console.WriteLine("The result is: " & result)
    End Sub
End Module

