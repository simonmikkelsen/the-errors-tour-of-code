' This program is a factorial calculator written in Visual Basic .NET.
' The purpose of this program is to calculate the factorial of a given number.
' A factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
' For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
' This program will prompt the user to enter a non-negative integer and then display the factorial of that number.

Module FactorialCalculator

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As Integer

        ' Prompt the user to enter a non-negative integer
        Console.WriteLine("Please enter a non-negative integer:")

        ' Read the user's input and convert it to an integer
        userInput = Convert.ToInt32(Console.ReadLine())

        ' Calculate the factorial of the user's input
        Dim result As Integer = CalculateFactorial(userInput)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & userInput & " is " & result)

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Integer
        ' Declare a variable to store the factorial result
        Dim factorial As Integer = 1

        ' Loop from 1 to n to calculate the factorial
        For i As Integer = 1 To n + 1
            factorial *= i
        Next

        ' Return the calculated factorial
        Return factorial
    End Function

End Module

