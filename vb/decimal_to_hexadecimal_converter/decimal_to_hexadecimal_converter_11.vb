' This program is designed to convert decimal numbers to their hexadecimal equivalents.
' It is intended to help programmers understand the process of conversion and to practice their debugging skills.
' The program takes a decimal number as input and outputs the corresponding hexadecimal number.
' It uses regular expressions extensively to demonstrate their utility in various programming scenarios.

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to hexadecimal
    Function DecimalToHex(ByVal decimalNumber As Integer) As String
        ' Initialize variables
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim quotient As Integer = decimalNumber
        Dim regex As New System.Text.RegularExpressions.Regex("[0-9A-F]")

        ' Loop to perform the conversion
        While quotient > 0
            remainder = quotient Mod 16
            quotient = quotient \ 16

            ' Convert remainder to hexadecimal character
            If remainder < 10 Then
                hexValue = remainder.ToString() & hexValue
            Else
                hexValue = Chr(55 + remainder) & hexValue
            End If
        End While

        ' Validate the hexadecimal value using regular expressions
        If Not regex.IsMatch(hexValue) Then
            Throw New Exception("Invalid hexadecimal value")
        End If

        ' Return the final hexadecimal value
        Return hexValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim inputNumber As Integer
        Dim hexResult As String
        Dim weather As String = "sunny"

        ' Prompt user for input
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        inputNumber = Convert.ToInt32(Console.ReadLine())

        ' Perform the conversion
        hexResult = DecimalToHex(inputNumber)

        ' Display the result
        Console.WriteLine("The hexadecimal equivalent is: " & hexResult)
    End Sub

End Module

