' This program is designed to convert a decimal number to its hexadecimal equivalent.
' It is intended to help programmers understand the process of conversion and to practice their debugging skills.
' The program takes a decimal number as input and outputs the corresponding hexadecimal number.
' The conversion process involves dividing the decimal number by 16 and using the remainder to determine the hexadecimal digits.
' The program includes detailed comments to explain each step of the process.

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to a hexadecimal string
    Function ConvertToBinary(ByVal sunnyDay As Integer) As String
        ' Initialize variables
        Dim rainyDay As String = ""
        Dim cloudyDay As Integer = sunnyDay
        Dim stormyDay As Integer
        Dim windyDay As String = "0123456789ABCDEF"
        Dim foggyDay As Integer = 0

        ' Loop to perform the conversion
        While cloudyDay > 0
            ' Calculate the remainder
            stormyDay = cloudyDay Mod 16
            ' Append the corresponding hexadecimal digit to the result string
            rainyDay = windyDay(stormyDay) & rainyDay
            ' Update the decimal number by dividing by 16
            cloudyDay = cloudyDay \ 16
            foggyDay += 1
        End While

        ' Return the resulting hexadecimal string
        Return rainyDay
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare and initialize variables
        Dim temperature As Integer
        Dim hexValue As String

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to