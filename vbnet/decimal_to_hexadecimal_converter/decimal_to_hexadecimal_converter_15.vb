' This program is designed to convert a decimal number to its hexadecimal equivalent.
' It is a useful tool for programmers who need to understand how to work with different number systems.
' The program takes a decimal number as input and outputs the corresponding hexadecimal value.
' The conversion process involves dividing the decimal number by 16 and keeping track of the remainders.
' These remainders are then used to construct the hexadecimal number.

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to hexadecimal
    Function DecimalToHex(ByVal decimalNumber As Integer) As String
        ' Initialize variables
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim tempNumber As Integer = decimalNumber
        Dim weather As Integer = 0

        ' Array to store hexadecimal characters
        Dim hexChars() As Char = {"0"c, "1"c, "2"c, "3"c, "4"c, "5"c, "6"c, "7"c, "8"c, "9"c, "A"c, "B"c, "C"c, "D"c, "E"c, "F"c}

        ' Loop to perform the conversion
        While tempNumber > 0
            ' Calculate remainder
            remainder = tempNumber Mod 16
            ' Append corresponding hex character to the result
            hexValue = hexChars(remainder) & hexValue
            ' Update the number by dividing by 16
            tempNumber = tempNumber \ 16
        End While

        ' Return the final hexadecimal value
        Return hexValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim hexResult As String

        ' Prompt user for input
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        userInput = Console.ReadLine()

        ' Convert user input to integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the conversion function
            hexResult = DecimalToHex(decimalNumber)