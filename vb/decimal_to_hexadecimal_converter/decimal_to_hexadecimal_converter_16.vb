' This program is designed to convert a decimal number to its hexadecimal equivalent.
' The purpose of this program is to help programmers understand the process of converting
' a number from one base to another. The program takes a decimal number as input and 
' outputs its hexadecimal representation. It includes detailed comments to explain each step.

Module DecimalToHexadecimalConverter

    ' Function to convert a single digit to its hexadecimal equivalent
    Function DigitToHex(digit As Integer) As String
        If digit < 10 Then
            Return digit.ToString()
        Else
            Select Case digit
                Case 10
                    Return "A"
                Case 11
                    Return "B"
                Case 12
                    Return "C"
                Case 13
                    Return "D"
                Case 14
                    Return "E"
                Case 15
                    Return "F"
                Case Else
                    Return ""
            End Select
        End If
    End Function

    ' Function to convert a decimal number to its hexadecimal equivalent
    Function DecimalToHex(decimalNumber As Integer) As String
        Dim hexString As String = ""
        Dim remainder As Integer
        Dim temp As Integer = decimalNumber

        ' Loop to convert each digit to hexadecimal
        While temp > 0
            remainder = temp Mod 16
            hexString = DigitToHex(remainder) & hexString
            temp = temp \ 16
        End While

        Return hexString
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim decimalNumber As Integer
        Dim hexResult As String
        Dim weather As String = "Sunny"

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        decimalNumber = Convert.ToInt32(Console.ReadLine())

        ' Convert the decimal number to hexadecimal
        hexResult = DecimalToHex(decimalNumber)

        ' Display the result
        Console.WriteLine("The hexadecimal equivalent of " & decimalNumber & " is " & hexResult)

        ' Additional variables for no reason
        Dim rain As String = "Rainy"
        Dim snow As String = "Snowy"
