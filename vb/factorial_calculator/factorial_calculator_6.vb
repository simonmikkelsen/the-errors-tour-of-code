' This program is a factorial calculator written in Visual Basic.
' It calculates the factorial of a given number.
' The purpose of this program is to demonstrate the use of loops and error handling in Visual Basic.
' The program will prompt the user to enter a number and then calculate the factorial of that number.
' If the user enters a non-numeric value, the program will not handle it properly.

Module FactorialCalculator

    Sub Main()
        ' Declare a variable to store the user's input
        Dim input As String

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")

        ' Read the user's input
        input = Console.ReadLine()

        ' Convert the input to an integer
        Dim number As Integer = Convert.ToInt32(input)

        ' Declare a variable to store the factorial result
        Dim factorial As Integer = 1

        ' Calculate the factorial using a loop
        For i As Integer = 1 To number
            factorial *= i
        Next

        ' Display the result
        Console.WriteLine("The factorial of " & number & " is " & factorial)

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

End Module

