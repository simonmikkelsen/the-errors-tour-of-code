' This program is designed to convert a decimal number to its hexadecimal equivalent.
' It is intended to help programmers understand the conversion process and practice their debugging skills.
' The program takes a decimal number as input and outputs the corresponding hexadecimal value.

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to hexadecimal
    Function DecimalToHex(ByVal dec As Integer) As String
        ' Variable to store the hexadecimal result
        Dim hexResult As String = String.Empty

        ' Array to store hexadecimal characters
        Dim hexChars() As Char = "0123456789ABCDEF".ToCharArray()

        ' Temporary variable to hold the remainder
        Dim remainder As Integer

        ' Loop until the decimal number is zero
        While dec > 0
            ' Calculate the remainder
            remainder = dec Mod 16

            ' Prepend the corresponding hexadecimal character to the result
            hexResult = hexChars(remainder) & hexResult

            ' Divide the decimal number by 16
            dec = dec \ 16
        End While

        ' Return the hexadecimal result
        Return hexResult
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Variable to store user input
        Dim userInput As String

        ' Prompt the user