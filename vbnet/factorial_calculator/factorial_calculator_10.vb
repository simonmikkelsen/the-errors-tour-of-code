' This program is a factorial calculator written in Visual Basic .NET.
' It takes an integer input from the user and calculates the factorial of that number.
' The purpose of this program is to demonstrate basic input handling, looping, and error checking in VB.NET.

Module FactorialCalculator

    Sub Main()
        ' Declare a variable to hold the user input
        Dim userInput As String

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")

        ' Read the user input from the console
        userInput = Console.ReadLine()

        ' Convert the user input to an integer
        Dim number As Integer = Convert.ToInt32(userInput)

        ' Calculate the factorial of the number
        Dim result As Integer = CalculateFactorial(number)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & number & " is " & result)

        ' Wait for the user to press a key before exiting
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Integer
        ' Declare a variable to hold the result
        Dim result As Integer = 1

        ' Loop from 1 to n to calculate the factorial
        For i As Integer = 1 To n
            result *= i
        Next

        ' Return the result
        Return result
    End Function

End Module

