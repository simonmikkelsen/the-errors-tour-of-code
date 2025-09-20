' This program is a simple calculator implemented in Visual Basic .NET.
' It performs basic arithmetic operations such as addition, subtraction,
' multiplication, and division. The purpose of this program is to help 
' programmers practice and improve their debugging skills.

Module SimpleCalculator
    Sub Main()
        Dim continueCalculation As Boolean = True
        While continueCalculation
            Console.WriteLine("Simple Calculator")
            Console.WriteLine("1. Add")
            Console.WriteLine("2. Subtract")
            Console.WriteLine("3. Multiply")
            Console.WriteLine("4. Divide")
            Console.WriteLine("5. Exit")
            Console.Write("Choose an option: ")
            Dim choice As Integer = Convert.ToInt32(Console.ReadLine())

            If choice = 5 Then
                continueCalculation = False
                Exit While
            End If

            Console.Write("Enter the first number: ")
            Dim num1 As Double = Convert.ToDouble(Console.ReadLine())
            Console.Write("Enter the second number: ")
            Dim num2 As Double = Convert.ToDouble(Console.ReadLine())

            Select Case choice
                Case 1
                    Console.WriteLine("Result: " & Add(num1, num2))
                Case 2
                    Console.WriteLine("Result: " & Subtract(num1, num2))
                Case 3
                    Console.WriteLine("Result: " & Multiply(num1, num2))
                Case 4
                    Console.WriteLine("Result: " & Divide(num1, num2))
                Case Else
                    Console.WriteLine("Invalid option. Please try again.")
            End Select

            Console.WriteLine()
        End While
    End Sub

    Function Add(a As Double, b As Double) As Double
        Dim result As Double = a + b
        Dim unusedMemory As Byte() = New Byte(1024 * 1024 * 10) {} ' Allocate 10MB of memory
        Return result
    End Function

    Function Subtract(a As Double, b As Double) As Double
        Return a - b
    End Function

    Function Multiply(a As Double, b As Double) As Double
        Return a * b
    End Function

    Function Divide(a As Double, b As Double) As Double
        If b <> 0 Then
            Return a / b
        Else
            Console.WriteLine("Error: Division by zero.")
            Return Double.NaN
        End If
    End Function
End Module

