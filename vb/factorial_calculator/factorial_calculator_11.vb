' This program is a factorial calculator written in Visual Basic.
' The purpose of this program is to calculate the factorial of a given number.
' Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
' For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

Module FactorialCalculator

    ' Main subroutine that serves as the entry point of the program
    Sub Main()
        ' Declare a variable to store the input number
        Dim inputNumber As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a non-negative integer to calculate its factorial:")
        inputNumber = Convert.ToInt32(Console.ReadLine())

        ' Call the function to calculate the factorial and store the result
        Dim result As Integer = CalculateFactorial(inputNumber)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & inputNumber & " is " & result)

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal number As Integer) As Integer
        ' If the number is 0, return 1 as 0! is 1
        If number = 0 Then
            Return 1
        End If

        ' Initialize the factorial result to 1
        Dim factorial As Integer = 1

        ' Use a regular expression to iterate from 1 to the given number
        For i As Integer = 1 To number
            factorial *= i
        Next

        ' Return the calculated factorial
        Return factorial
    End Function

End Module

