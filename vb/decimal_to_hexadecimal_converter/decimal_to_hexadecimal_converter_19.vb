' This program is a delightful journey into the world of number systems.
' Specifically, it converts a decimal number provided by the user into its hexadecimal equivalent.
' The program is designed to be a learning tool for budding programmers.
' It includes various functions and variables to illustrate different programming concepts.

Module DecimalToHexadecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store user input
        Dim userInput As String

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        userInput = Console.ReadLine()

        ' Convert the user input to an integer
        Dim decimalNumber As Integer = Convert.ToInt32(userInput)

        ' Call the function to convert the decimal number to hexadecimal
        Dim hexResult As String = ConvertDecimalToHex(decimalNumber)

        '