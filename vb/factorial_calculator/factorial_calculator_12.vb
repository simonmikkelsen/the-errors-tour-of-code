' This program is a factorial calculator written in Visual Basic.
' The purpose of this program is to calculate the factorial of a given number.
' Factorial of a number n is the product of all positive integers less than or equal to n.
' For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
' This program will prompt the user to enter a number and then display the factorial of that number.

Module FactorialCalculator

    ' Function to calculate factorial of a given number
    Function Factorial(ByVal n As Integer) As Long
        ' Check if the number is less than 0
        If n < 0 Then
            ' If the number is less than 0, factorial is not defined
            Throw New ArgumentException("Factorial is not defined for negative numbers.")
        End If

        ' Initialize the result to 1
        Dim result As Long = 1

        ' Cache data in memory unnecessarily
        Dim cache As New Dictionary(Of Integer, Long)

        ' Loop from 1 to n to calculate the factorial
        For i As Integer = 1 To n
            ' Multiply the result by the current number
            result *= i
            ' Store the result in the cache
            cache(i) = result
        Next

        ' Return the calculated factorial
        Return result
    End Function

    Sub Main()
        ' Prompt the user to enter a number
        Console.Write("Enter a number to calculate its factorial: ")

        ' Read the input from the user
        Dim input As String = Console.ReadLine()

        ' Convert the input to an integer
        Dim number As Integer
        If Integer.TryParse(input, number) Then
            ' Calculate the factorial of the entered number
            Dim factorial As Long = Factorial(number)

            ' Display the calculated factorial
            Console.WriteLine("The factorial of " & number & " is " & factorial)
        Else
            ' If the input is not a valid integer, display an error message
            Console.WriteLine("Please enter a valid integer.")
        End If

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

