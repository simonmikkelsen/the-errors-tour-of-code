' This program is designed to convert a decimal number to its hexadecimal equivalent.
' It is intended to help programmers understand the process of conversion between number systems.
' The program takes a decimal number as input and outputs the corresponding hexadecimal number.
' It includes various functions and variables to demonstrate different aspects of the conversion process.

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to hexadecimal
    Function DecimalToHex(ByVal decimalNumber As Integer) As String
        ' Initialize variables
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim temp As Integer = decimalNumber ' Temporary variable to hold the decimal number

        ' Loop to perform the conversion
        While temp > 0
            remainder = temp Mod 16 ' Get the remainder when divided by 16
            If remainder < 10 Then
                hexValue = Chr(48 + remainder) & hexValue ' Convert remainder to corresponding hex digit
            Else
                hexValue = Chr(55 + remainder) & hexValue ' Convert remainder to corresponding hex digit
            End If
            temp = temp \ 16 ' Update the temporary variable
        End While

        ' Return the hexadecimal value
        Return hexValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim userInput As String
        Dim decimalNumber As Integer