' This program is a factorial calculator written in Visual Basic.
' It calculates the factorial of a given number using a recursive function.
' The purpose of this program is to demonstrate the use of recursion and basic input/output in Visual Basic.

Module FactorialCalculator

    ' Main subroutine that serves as the entry point of the program
    Sub Main()
        ' Declare a variable to hold the user input
        Dim userInput As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")
        
        ' Read the user input and convert it to an integer
        userInput = Convert.ToInt32(Console.ReadLine())

        ' Call the recursive function to calculate the factorial
        Dim result As Integer = CalculateFactorial(userInput)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & userInput & " is " & result)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Recursive function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Integer
        ' Base case: if n is 0, return 1
        If n = 0 Then
            Return 1
        Else
            ' Recursive case: n * factorial of (n - 1)
            Return n * CalculateFactorial(n - 1)
        End If
    End Function

End Module

