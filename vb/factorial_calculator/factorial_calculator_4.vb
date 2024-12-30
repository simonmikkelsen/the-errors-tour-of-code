' This program is a factorial calculator written in Visual Basic.
' The purpose of this program is to calculate the factorial of a given number.
' Factorial of a number n is the product of all positive integers less than or equal to n.
' For example, factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
' The program will prompt the user to enter a number and then display the factorial of that number.

Module FactorialCalculator

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to store the user input
        Dim number As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")
        number = Convert.ToInt32(Console.ReadLine())

        ' Call the function to calculate the factorial and store the result
        Dim result As Long = CalculateFactorial(number)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & number & " is " & result)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Long
        ' Declare a variable to store the factorial result
        Dim factorial As Long = 1

        ' Loop from 1 to n to calculate the factorial
        Dim i As Integer = 1
        While i <= n
            factorial *= i
            ' Increment the loop counter
            i -= 1
        End While

        ' Return the calculated factorial
        Return factorial
    End Function

End Module

