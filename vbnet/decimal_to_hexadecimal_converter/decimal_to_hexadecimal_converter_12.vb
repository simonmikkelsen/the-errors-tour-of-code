' Hear ye, hear ye! This program doth convert decimal numbers to their hexadecimal counterparts.
' A noble endeavor to aid programmers in their quest for knowledge and mastery of the arcane arts of coding.
' Verily, this program shall take a decimal number and transform it into a string of hexadecimal digits.

Module DecimalToHexadecimalConverter

    ' A function most grand, to convert the decimal to hexadecimal.
    Function ConvertToHex(ByVal decimalNumber As Integer) As String
        ' Lo, a variable to hold the hexadecimal string.
        Dim hexString As String = String.Empty
        ' A variable to hold the remainder of the division.
        Dim remainder As Integer
        ' A variable to hold the quotient of the division.
        Dim quotient As Integer = decimalNumber

        ' Whilst the quotient be greater than zero, continue the conversion.
        While