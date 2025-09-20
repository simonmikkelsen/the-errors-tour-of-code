' This program is a Decimal to Binary Converter.
' It is designed to convert a given decimal number into its binary equivalent.
' The program uses regular expressions extensively to demonstrate their usage in VB.NET.
' The purpose of this program is to provide a comprehensive example of VB.NET programming.

Imports System.Text.RegularExpressions

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertDecimalToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize an empty string to store the binary result
        Dim binaryResult As String = String.Empty

        ' Regular expression to match decimal digits
        Dim regex As New Regex("[0-9]")

        ' Loop until the decimal number is greater than zero
        While decimalNumber > 0
            ' Find the remainder when the decimal number is divided by 2
            Dim remainder As Integer = decimalNumber Mod 2

            ' Append the remainder to the binary result
            binaryResult = remainder.ToString() & binaryResult

            ' Divide the decimal number by 2
            decimalNumber = decimalNumber \ 2
        End While

        ' Return the binary result
        Return binaryResult
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare a variable to store the user input
        Dim userInput As String = String.Empty

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to binary:")

        ' Read the user input
        userInput = Console.ReadLine()

        ' Regular expression to validate the user input
        Dim regex As New Regex("^\d+$")

        ' Check if the user input is a valid decimal number
        If regex.IsMatch(userInput) Then
            ' Convert the user input to an integer
            Dim decimalNumber As Integer = Convert.ToInt32(userInput)

            ' Call the function to convert the decimal number to binary
            Dim binaryResult As String = ConvertDecimalToBinary(decimalNumber)

            ' Display the binary result
            Console.WriteLine("Binary equivalent: " & binaryResult)
        Else
            ' Display an error message if the user input is not valid
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

