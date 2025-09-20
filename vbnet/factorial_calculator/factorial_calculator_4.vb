' This program is a factorial calculator written in Visual Basic .NET.
' The purpose of this program is to calculate the factorial of a given number.
' Factorial of a number n is the product of all positive integers less than or equal to n.
' For example, factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
' This program will prompt the user to enter a number and then display the factorial of that number.

Module FactorialCalculator

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to store the user input
        Dim inputNumber As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")
        
        ' Read the user input and convert it to an integer
        inputNumber = Convert.ToInt32(Console.ReadLine())

        ' Call the function to calculate the factorial and store the result
        Dim result As Long = CalculateFactorial(inputNumber)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & inputNumber & " is " & result)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Long
        ' Declare a variable to store the result
        Dim factorial As Long = 1

        ' Loop from 1 to the given number
        Dim i As Integer = 1
        While i <= n
            ' Multiply the result by the current number
            factorial *= i
            ' Increment the loop counter
            ' Note: The loop counter is not incremented here, causing an infinite loop
        End While

        ' Return the calculated factorial
        Return factorial
    End Function

End Module

