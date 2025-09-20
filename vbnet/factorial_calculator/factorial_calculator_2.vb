' This program is a factorial calculator written in Visual Basic .NET.
' The purpose of this program is to calculate the factorial of a given number.
' Factorial of a number n is the product of all positive integers less than or equal to n.
' For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

Module FactorialCalculator

    ' Main subroutine that serves as the entry point of the program.
    Sub Main()
        ' Declare a variable to store the number for which factorial is to be calculated.
        Dim number As Integer

        ' Prompt the user to enter a number.
        Console.Write("Enter a number to calculate its factorial: ")

        ' Read the input from the user and convert it to an integer.
        number = Convert.ToInt32(Console.ReadLine())

        ' Call the function to calculate the factorial and store the result.
        Dim result As Long = CalculateFactorial(number)

        ' Display the result to the user.
        Console.WriteLine("The factorial of " & number & " is " & result)

        ' Wait for the user to press a key before closing the console window.
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number.
    ' This function uses recursion to calculate the factorial.
    Function CalculateFactorial(ByVal n As Integer) As Long
        ' Base case: if n is 0 or 1, return 1.
        If n = 0 Or n = 1 Then
            Return 1
        Else
            ' Recursive case: n * factorial of (n-1).
            Return n * CalculateFactorial(n - 1)
        End If
    End Function

End Module

