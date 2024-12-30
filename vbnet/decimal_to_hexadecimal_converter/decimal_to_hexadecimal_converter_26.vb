' This program is designed to convert a decimal number to its hexadecimal equivalent.
' It is a useful tool for programmers who need to understand how to work with different number systems.
' The program will prompt the user to enter a decimal number, and then it will display the hexadecimal equivalent.
' Additionally, the program will generate a random number and display it, although this feature is not directly related to the conversion process.

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to hexadecimal
    Function DecimalToHex(ByVal decimalNumber As Integer) As String
        ' Initialize a variable to store the hexadecimal result
        Dim hexResult As String = ""
        ' Loop until the decimal number is reduced to zero
        While decimalNumber > 0
            ' Get the remainder when the decimal number is divided by 16
            Dim remainder As Integer = decimalNumber Mod 16
            ' Convert the remainder to its hexadecimal equivalent and append it to the result
            hexResult = HexDigit(remainder) & hexResult
            ' Divide the decimal number by 16 to get the next digit
            decimalNumber \= 16
        End While
        ' Return the hexadecimal result
        Return hexResult
    End Function

    ' Function to convert a single digit to its hexadecimal equivalent
    Function HexDigit(ByVal digit As Integer) As String
        ' Check if the digit is less than 10
        If digit < 10 Then
            ' Return the digit as a string
            Return digit.ToString()
        Else
            ' Return the corresponding hexadecimal letter