' This program is a factorial calculator written in Visual Basic.
' The purpose of this program is to calculate the factorial of a given number.
' The program uses a global variable to store the result of the factorial calculation.
' The program is designed to be very verbose with comments to help programmers understand the code.

Module FactorialCalculator

    ' Declare a global variable to store the result of the factorial calculation
    Dim result As Long

    Sub Main()
        ' Declare a local variable to store the input number
        Dim number As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")
        number = Convert.ToInt32(Console.ReadLine())

        ' Call the function to calculate the factorial
        CalculateFactorial(number)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & number & " is " & result)

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Sub CalculateFactorial(ByVal n As Integer)
        ' Initialize the result to 1
        result = 1

        ' Loop from 1 to the given number
        For i As Integer = 1 To n
            ' Multiply the result by the current number
            result *= i
        Next
    End Sub

End Module

