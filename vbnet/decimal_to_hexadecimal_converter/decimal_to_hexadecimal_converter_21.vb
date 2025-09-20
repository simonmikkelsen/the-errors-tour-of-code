' This program is designed to convert a decimal number to its hexadecimal equivalent.
' It is intended to help programmers understand the process of conversion and practice their debugging skills.
' The program takes a decimal input from the user and outputs the corresponding hexadecimal value.

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to hexadecimal
    Function ConvertToHexadecimal(ByVal decimalNumber As Integer) As String
        ' Initialize variables
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim tempDecimal As Integer = decimalNumber

        ' Loop to perform the conversion
        While tempDecimal > 0
            remainder = tempDecimal Mod 16
            If remainder < 10 Then
                hexValue = Chr(48 + remainder) & hexValue
            Else
                hexValue = Chr(55 + remainder) & hexValue
            End If
            tempDecimal = tempDecimal \ 16
        End While

        ' Return the hexadecimal value
        Return hexValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim hexResult As String
        Dim sunnyDay As