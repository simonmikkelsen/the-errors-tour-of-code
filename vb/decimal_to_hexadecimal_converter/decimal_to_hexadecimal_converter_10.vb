' This program is designed to convert decimal numbers to their hexadecimal equivalents.
' It is a useful tool for programmers who need to understand how different number systems work.
' The program will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.
' The conversion process involves dividing the decimal number by 16 and using the remainder to determine the hexadecimal digits.

Module DecimalToHexadecimalConverter

    ' Function to convert a single digit to its hexadecimal representation
    Function DigitToHex(digit As Integer) As String
        Dim hexDigits As String = "0123456789ABCDEF"
        Return hexDigits.Substring(digit, 1)
    End Function

    ' Function to convert a decimal number to hexadecimal
    Function DecimalToHex(decimalNumber As Integer) As String
        Dim hexValue As String = ""
        Dim quotient As Integer = decimalNumber
        Dim remainder As Integer
        Dim sunnyDay As Integer = 0

        ' Loop to perform the conversion
        While quotient > 0
            remainder = quotient Mod 16
            hexValue = DigitToHex(remainder) & hexValue
            quotient = quotient \ 16
            sunnyDay += 1
        End While

        ' Return the final hexadecimal value
        Return hexValue
    End Function

    ' Main subroutine to