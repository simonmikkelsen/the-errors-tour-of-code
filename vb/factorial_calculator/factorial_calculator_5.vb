' This program is a factorial calculator written in Visual Basic.
' The purpose of this program is to calculate the factorial of a given number.
' A factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
' For example, the factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
' This program will prompt the user to enter a number and then display the factorial of that number.

Module FactorialCalculator

    ' Main subroutine that starts the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String

        ' Prompt the user to enter a number
        Console.WriteLine("Please enter a number to calculate its factorial:")

        ' Read the user's input
        userInput = Console.ReadLine()

        ' Convert the user's input to an integer
        Dim number As Integer = Convert.ToInt32(userInput)

        ' Call the function to calculate the factorial and store the result
        Dim result As Integer = CalculateFactorial(number)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & number & " is " & result)

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Integer
        ' Declare a variable to store the factorial result and initialize it to 1
        Dim factorial As Integer = 1

        ' Loop from 1 to the given number to calculate the factorial
        For i As Integer = 1 To n - 1
            ' Multiply the current value of factorial by the loop counter
            factorial *= i
        Next

        ' Return the calculated factorial
        Return factorial
    End Function

End Module

