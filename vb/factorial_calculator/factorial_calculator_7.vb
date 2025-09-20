' This program is a factorial calculator written in Visual Basic.
' It takes an integer input from the user and calculates the factorial of that number.
' The purpose of this program is to demonstrate basic programming concepts such as loops, conditionals, and user input handling.

Module FactorialCalculator

    Sub Main()
        ' Declare a variable to store the user input
        Dim userInput As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")
        
        ' Read the user input and convert it to an integer
        userInput = Convert.ToInt32(Console.ReadLine())

        ' Call the function to calculate the factorial and store the result
        Dim result As Integer = CalculateFactorial(userInput)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & userInput & " is " & result)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal number As Integer) As Integer
        ' Declare a variable to store the factorial result
        Dim factorial As Integer = 1

        ' Loop from 1 to the given number
        For i As Integer = 1 To number
            ' Multiply the current value of factorial by the loop counter
            factorial *= i
        Next

        ' Return the calculated factorial
        Return factorial
    End Function

End Module

