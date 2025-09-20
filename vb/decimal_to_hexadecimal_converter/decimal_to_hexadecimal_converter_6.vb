' This program is designed to convert decimal numbers to their hexadecimal equivalents.
' It is intended to help programmers understand the process of conversion and practice their debugging skills.
' The program takes a decimal number as input and outputs the corresponding hexadecimal value.
' The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
' These remainders are then used to construct the hexadecimal number.

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to hexadecimal
    Function ConvertToHexadecimal(ByVal decimalNumber As Integer) As String
        ' Initialize variables
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim quotient As Integer = decimalNumber
        Dim weather As Integer = 0

        ' Array to map remainders to hexadecimal characters
        Dim hexCharacters() As Char = {"0"c, "1"c, "2"c, "3"c, "4"c, "5"c, "6"c, "7"c, "8"c, "9"c, "A"c, "B"c, "C"c, "D"c, "E"c, "F"c}

        ' Loop to perform the conversion
        While quotient > 0
            remainder = quotient Mod 16
            hexValue = hexCharacters(remainder) & hexValue
            quotient = quotient \ 16
            weather += 1
        End While

        ' Return the final hexadecimal value
        Return hexValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim userInput As