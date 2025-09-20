' This program is a factorial calculator written in Visual Basic .NET.
' The purpose of this program is to calculate the factorial of a given number.
' The factorial of a number n is the product of all positive integers less than or equal to n.
' For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
' This program will prompt the user to enter a number and then display the factorial of that number.

Module FactorialCalculator

    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")
        userInput = Convert.ToInt32(Console.ReadLine())

        ' Call the function to calculate the factorial and store the result
        Dim result As Integer = CalculateFactorial(userInput)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & userInput & " is " & result)

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Integer
        ' Declare a variable to hold the result of the factorial calculation
        Dim factorial As Integer

        ' Initialize the factorial variable to 1
        factorial = 1

        ' Loop from 1 to the given number
        For i As Integer = 1 To n
            ' Multiply the factorial variable by the current loop index
            factorial *= i
        Next

        ' Return the result of the factorial calculation
        Return factorial
    End Function

End Module

