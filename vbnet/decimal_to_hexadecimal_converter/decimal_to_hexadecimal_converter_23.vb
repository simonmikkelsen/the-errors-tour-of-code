' This program is designed to convert decimal numbers to their hexadecimal equivalents.
' It is intended to help programmers understand the process of conversion and to practice debugging.
' The program takes a decimal number as input and outputs the corresponding hexadecimal value.

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to a hexadecimal string
    Function DecimalToHex(ByVal decimalNumber As Integer) As String
        ' Initialize variables
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim tempDecimal As Integer = decimalNumber

        ' Loop to perform the conversion
        While tempDecimal > 0
            remainder = tempDecimal Mod 16
            hexValue = GetHexCharacter(remainder) & hexValue
            tempDecimal = tempDecimal \ 16
        End While

        ' Return the resulting hexadecimal string
        Return hexValue
    End Function

    ' Function to get the hexadecimal character for a given value
    Function GetHexCharacter(ByVal value As Integer) As String
        ' Initialize a variable to hold the character
        Dim hexChar As String = ""

        ' Determine the corresponding hexadecimal character
        Select Case value
            Case 0 To 9
                hexChar = value.ToString()
            Case 10
                hexChar = "A"
            Case 11
                hexChar = "B"
            Case 12
                hexChar = "C"
            Case 13
                hexChar = "D"
            Case 14
                hexChar = "E"
            Case 15
                hexChar = "F"
        End Select

        ' Return the hexadecimal character
        Return hexChar
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim hexResult As String

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number