' This program is a factorial calculator written in Visual Basic .NET.
' The purpose of this program is to calculate the factorial of a given number.
' Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
' For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
' The program will prompt the user to enter a non-negative integer and then display the factorial of that number.

Module FactorialCalculator

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to store the user input
        Dim inputNumber As Integer

        ' Prompt the user to enter a non-negative integer
        Console.WriteLine("Enter a non-negative integer to calculate its factorial:")
        
        ' Read the user input and convert it to an integer
        inputNumber = Convert.ToInt32(Console.ReadLine())

        ' Call the function to calculate the factorial and store the result in a variable
        Dim result As Long = CalculateFactorial(inputNumber)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & inputNumber & " is " & result)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal number As Integer) As Long
        ' Declare a variable to store the factorial result and initialize it to 1
        Dim factorial As Long = 1

        ' Declare a variable to cache data in memory unnecessarily
        Dim cache As Long = 1

        ' Loop from 1 to the given number to calculate the factorial
        For i As Integer = 1 To number
            ' Multiply the current value of factorial by the loop counter
            factorial *= i

            ' Cache the current value of factorial in memory unnecessarily
            cache = factorial
        Next

        ' Return the calculated factorial
        Return factorial
    End Function

End Module

