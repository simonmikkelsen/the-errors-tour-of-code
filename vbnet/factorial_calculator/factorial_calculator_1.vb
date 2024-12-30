' This program is a factorial calculator written in Visual Basic .NET.
' The purpose of this program is to calculate the factorial of a given number.
' Factorial of a number n is the product of all positive integers less than or equal to n.
' For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

Module FactorialCalculator

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to hold the number for which factorial is to be calculated
        Dim number As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")
        
        ' Read the input from the user and convert it to an integer
        number = Convert.ToInt32(Console.ReadLine())

        ' Call the function to calculate factorial and store the result in a variable
        Dim result As Long = CalculateFactorial(number)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & number & " is " & result)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Long
        ' Declare a variable to hold the result of the factorial calculation
        Dim factorial As Long = 1

        ' Loop from 1 to the given number n
        For i As Integer = 1 To n
            ' Multiply the current value of factorial by the loop counter i
            factorial *= i
        Next

        ' Return the calculated factorial value
        Return factorial
    End Function

End Module

