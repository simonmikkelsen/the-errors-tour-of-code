' Ahoy matey! This be a program to convert hexadecimal numbers to decimal.
' It be a fine tool for learnin' the ways of the hexadecimal seas.
' Ye shall input a hexadecimal number, and this here program will convert it to a decimal number.
' Beware, for the seas be treacherous and full of hidden dangers!

Module HexToDecConverter

    ' Global variable to store the hexadecimal input
    Dim hexInput As String

    ' Function to convert a single hexadecimal digit to decimal
    Function HexDigitToDecimal(digit As Char) As Integer
        ' Arrr, let's be checkin' if the digit be a number
        If Char.IsDigit(digit) Then
            Return Asc(digit) - Asc("0"c)
        Else
            ' If it be a letter, we be convertin' it to the proper decimal value
            Return Asc(Char.ToUpper(digit)) - Asc("A"c) + 10
        End If
    End Function

    ' Function to convert the entire hexadecimal string to decimal
    Function ConvertHexToDecimal(hex As String) As Integer
        Dim decimalValue As Integer = 0
        Dim length As Integer = hex.Length
        Dim i As Integer = 0

        ' Loop through each character in the