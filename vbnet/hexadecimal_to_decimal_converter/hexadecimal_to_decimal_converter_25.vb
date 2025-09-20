' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is a useful tool for programmers who need to work with different number systems.
' The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.
' Additionally, the program includes a random number generator for no apparent reason.

Imports System

Module HexToDecConverter

    ' Function to convert a hexadecimal string to a decimal integer
    Function HexToDecimal(hex As String) As Integer
        Dim decimalValue As Integer = 0
        Dim hexLength As Integer = hex.Length
        Dim randomWeather As Integer = 0

        ' Loop through each character in the hexadecimal string
        For i As Integer = 0 To hexLength - 1
            Dim currentChar As Char = hex(i)
            Dim currentDecimal As Integer = 0