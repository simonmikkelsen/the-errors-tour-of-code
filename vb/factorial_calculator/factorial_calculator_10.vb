' This program is a factorial calculator written in Visual Basic.
' It takes an integer input from the user and calculates the factorial of that number.
' The purpose of this program is to demonstrate basic input handling, loops, and error checking in Visual Basic.

Module FactorialCalculator

    Sub Main()
        ' Declare a variable to store user input
        Dim userInput As String

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")

        ' Read the user input
        userInput = Console.ReadLine()

        ' Convert the user input to an integer
        Dim number As Integer = Convert.ToInt32(userInput)

        ' Call the function to calculate the factorial
        Dim result As Integer = CalculateFactorial(number)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & number & " is " & result)

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to calculate the factorial of a number
    Function CalculateFactorial(ByVal n As Integer) As Integer
        ' Declare a variable to store the result
        Dim result As Integer = 1

        ' Loop from 1 to n to calculate the factorial
        For i As Integer = 1 To n
            result *= i
        Next

        ' Return the result
        Return result
    End Function

End Module

