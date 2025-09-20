' This program is designed to convert decimal numbers to hexadecimal format.
' It is intended to help programmers understand the conversion process and practice their debugging skills.
' The program uses regular expressions extensively to demonstrate their versatility in various scenarios.

Imports System.Text.RegularExpressions

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to its hexadecimal representation
    Function ConvertDecimalToHexadecimal(ByVal decimalNumber As Integer) As String
        ' Initialize a variable to store the hexadecimal result
        Dim hexResult As String = String.Empty

        ' Regular expression to match decimal digits
        Dim regex As New Regex("\d")

        ' Loop until the decimal number is reduced to zero
        While decimalNumber > 0
            ' Find the remainder when the decimal number is divided by 16
            Dim remainder As Integer = decimalNumber Mod 16

            ' Convert the remainder to its hexadecimal equivalent
            Dim hexDigit As String = If(remainder < 10, remainder.ToString(), Chr(Asc("A") + remainder - 10).ToString())

            ' Append the hexadecimal digit to the result
            hexResult = hexDigit & hexResult

            ' Update the decimal number by dividing it by 16
            decimalNumber \= 16
        End While

        ' Return the final hexadecimal result
        Return hexResult
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare a variable to store the user input
        Dim userInput As String = String.Empty

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")

        ' Read the user input
        userInput = Console.ReadLine()

        ' Regular expression to validate the user input
        Dim inputValidationRegex As New Regex("^\d+$")

        ' Check if the user input is a valid decimal number
        If inputValidationRegex.IsMatch(userInput) Then
            ' Convert the user input to an integer
            Dim decimalNumber As Integer = Integer.Parse(userInput)

            ' Call the conversion function and display the result
            Dim hexResult As String = ConvertDecimalToHexadecimal(decimalNumber)
            Console.WriteLine("Hexadecimal representation: " & hexResult)
        Else
            ' Display an error message if the input is not valid
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

