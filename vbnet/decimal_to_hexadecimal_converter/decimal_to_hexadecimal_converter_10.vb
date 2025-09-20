' This program is a decimal to hexadecimal converter.
' It is designed to help programmers understand the conversion process.
' The program takes a decimal number as input and converts it to its hexadecimal equivalent.
' The hexadecimal number is then displayed to the user.
' This program is written in Visual Basic .NET.

Module DecimalToHexadecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user input
        Dim userInput As String
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        ' Read the user input from the console
        userInput = Console.ReadLine()
        
        ' Convert the user input to an integer
        Dim decimalNumber As Integer = Convert.ToInt32(userInput)
        
        ' Call the function to convert the decimal number to hexadecimal
        Dim hexNumber As String = ConvertDecimalToHex(decimalNumber)
        
        ' Display the hexadecimal number to the user
        Console.WriteLine("The hexadecimal equivalent is: " & hexNumber)
        
        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to hexadecimal
    Function ConvertDecimalToHex(ByVal decimalNumber As Integer) As String
        ' Declare a variable to store the hexadecimal number
        Dim hexNumber As String = ""
        ' Declare a variable to store the remainder
        Dim remainder As Integer
        ' Declare a variable to store the current number
        Dim currentNumber As Integer = decimalNumber
        
        ' Loop until the current number is zero
        While currentNumber > 0
            ' Calculate the remainder when the current number is divided by 16
            remainder = currentNumber Mod 16
            ' Convert the remainder to a hexadecimal digit
            hexNumber = GetHexDigit(remainder) & hexNumber
            ' Divide the current number