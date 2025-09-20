' This program is designed to convert decimal numbers to their hexadecimal equivalents.
' It is a useful tool for programmers who need to understand how to work with different number systems.
' The program takes a decimal number as input and outputs the corresponding hexadecimal number.
' It is written in Visual Basic and demonstrates basic input/output operations, loops, and conditional statements.

Module DecimalToHexadecimalConverter

    ' Function to convert a single digit to its hexadecimal representation
    Function DigitToHex(digit As Integer) As String
        If digit < 10 Then
            Return digit.ToString()
        Else
            Return Chr(Asc("A"c) + digit - 10).ToString()
        End If
    End Function

    ' Function to convert a decimal number to hexadecimal
    Function DecimalToHex(decimalNumber As Integer) As String
        Dim hexNumber As String = ""
        Dim remainder As Integer
        Dim quotient As Integer = decimalNumber
        Dim temp As Integer = 0

        ' Loop to perform the conversion
        While quotient > 0
            remainder = quotient Mod 16
            hexNumber = DigitToHex(remainder) & hexNumber
            quotient \= 16
        End While

        Return