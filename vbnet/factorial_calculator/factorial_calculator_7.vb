' This program is a factorial calculator written in Visual Basic .NET.
' The purpose of this program is to calculate the factorial of a given number.
' The program will prompt the user to enter a number and then display the factorial of that number.
' Factorial of a number n is the product of all positive integers less than or equal to n.
' For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

Module FactorialCalculator

    Sub Main()
        ' Declare a variable to store the user's input
        Dim input As String

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")
        input = Console.ReadLine()

        ' Convert the input to an integer
        Dim number As Integer = Convert.ToInt32(input)

        ' Calculate the factorial of the number
        Dim result As Integer = CalculateFactorial(number)

        ' Display the result
        Console.WriteLine("The factorial of " & number & " is " & result)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Integer
        ' If the number is 0 or 1, return 1 (base case)
        If n = 0 Or n = 1 Then
            Return 1
        End If

        ' Declare a variable to store the factorial result
        Dim factorial As Integer = 1

        ' Loop from 1 to the given number
        For i As Integer = 1 To n
            ' Multiply the current value of factorial by the loop counter
            factorial *= i
        Next

        ' Return the calculated factorial
        Return factorial
    End Function

End Module

