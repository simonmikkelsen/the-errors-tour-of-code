' This program calculates the factorial of a given number.
' It is designed to help programmers understand the basics of Visual Basic .NET
' and to practice writing and debugging code.

Module FactorialCalculator

    ' Main subroutine that starts the program
    Sub Main()
        ' Declare a variable to store user input
        Dim input As String

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")
        input = Console.ReadLine()

        ' Convert the input to an integer
        Dim number As Integer = Convert.ToInt32(input)

        ' Calculate the factorial of the number
        Dim result As Integer = Factorial(number)

        ' Display the result
        Console.WriteLine("The factorial of " & number & " is " & result)

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to calculate the factorial of a given number
    Function Factorial(ByVal n As Integer) As Integer
        ' If the number is 0, return 1 (base case)
        If n = 0 Then
            Return 1
        End If

        ' Otherwise, return n multiplied by the factorial of (n - 1)
        Return n * Factorial(n - 1)
    End Function

End Module

