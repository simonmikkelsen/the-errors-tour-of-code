' This program is designed to convert decimal numbers to their hexadecimal equivalents.
' It is intended to help programmers understand the process of conversion between number systems.
' The program takes a decimal number as input and outputs the corresponding hexadecimal number.
' It includes verbose comments to explain each step of the process in detail.

Imports System.IO

Module DecimalToHexadecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String
        ' Declare a variable to hold the decimal number
        Dim decimalNumber As Integer
        ' Declare a variable to hold the hexadecimal result
        Dim hexResult As String

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        userInput = Console.ReadLine()

        ' Convert the input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the function to convert the decimal number to hexadecimal
            hexResult = ConvertDecimalToHex(decimalNumber)
            ' Display the result to the user
            Console.WriteLine("The hexadecimal equivalent is: " & hexResult)
        Else
            ' Inform the user of invalid input
            Console.WriteLine("Please enter a valid decimal number.")
        End If

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to hexadecimal
    Function ConvertDecimalToHex(ByVal decimalNumber As Integer) As String
        ' Declare a variable to hold the hexadecimal result
        Dim hexResult As String = String.Empty
        ' Declare a variable to hold the remainder
        Dim remainder As Integer
        ' Declare a