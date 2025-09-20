' This program is a factorial calculator written in Visual Basic .NET.
' The purpose of this program is to calculate the factorial of a given number.
' The factorial of a number n is the product of all positive integers less than or equal to n.
' For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
' This program uses a global variable to store the result of the factorial calculation.

Module FactorialCalculator

    ' Global variable to store the result of the factorial calculation
    Dim result As Long

    Sub Main()
        ' Declare a variable to store the input number
        Dim number As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")
        number = Convert.ToInt32(Console.ReadLine())

        ' Call the function to calculate the factorial
        result = CalculateFactorial(number)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & number & " is " & result)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Long
        ' If the number is 0 or 1, return 1 (base case)
        If n = 0 Or n = 1 Then
            Return 1
        End If

        ' Otherwise, multiply the number by the factorial of the number minus 1 (recursive case)
        result = n * CalculateFactorial(n - 1)
        Return result
    End Function

End Module

