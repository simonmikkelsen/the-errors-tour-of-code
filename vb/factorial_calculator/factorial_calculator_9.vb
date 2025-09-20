' This program is a factorial calculator written in Visual Basic.
' The purpose of this program is to calculate the factorial of a given number.
' A factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
' For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.

Module FactorialCalculator

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to store the number for which the factorial is to be calculated
        Dim number As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")

        ' Read the user input and convert it to an integer
        number = Convert.ToInt32(Console.ReadLine())

        ' Call the function to calculate the factorial and store the result in a variable
        Dim result As Integer = CalculateFactorial(number)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & number & " is " & result)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Integer
        ' Declare a variable to store the result of the factorial calculation
        Dim fact As Integer = 1

        ' Loop from 1 to the given number to calculate the factorial
        For i As Integer = 1 To n
            ' Multiply the result by the current number in the loop
            fact = fact * i
        Next

        ' Return the calculated factorial
        Return fact
    End Function

End Module

