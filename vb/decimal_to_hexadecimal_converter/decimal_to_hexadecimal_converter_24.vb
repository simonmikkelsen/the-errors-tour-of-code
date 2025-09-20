' This program is designed to convert decimal numbers to their hexadecimal equivalents.
' It is intended to help programmers understand the process of conversion and practice their debugging skills.
' The program will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to a hexadecimal string
    Function ConvertToHexadecimal(ByVal decimalNumber As Integer) As String
        ' Variable to store the hexadecimal result
        Dim hexResult As String = String.Empty

        ' Loop to perform the conversion
        While decimalNumber > 0
            ' Get the remainder when the number is