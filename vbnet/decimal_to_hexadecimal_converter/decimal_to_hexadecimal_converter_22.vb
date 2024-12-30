' This program is a Decimal to Hexadecimal Converter.
' The purpose of this program is to convert a given decimal number
' into its corresponding hexadecimal representation.
' The program will prompt the user to enter a decimal number,
' perform the conversion, and then display the hexadecimal result.
' This program is designed to help programmers understand the conversion process
' and to practice their skills in Visual Basic .NET.

Module DecimalToHexConverter

    ' Function to convert a decimal number to hexadecimal
    Function ConvertToHex(ByVal decimalNumber As Integer) As String
        ' Initialize an empty string to store the hexadecimal result
        Dim hexResult As String = String.Empty

        ' Loop until the decimal number is greater than zero
        While decimalNumber > 0
            ' Get the remainder when the decimal number is divided by 16
            Dim remainder As Integer = decimalNumber Mod 16

            ' Convert the remainder to its corresponding hexadecimal digit
            Dim hexDigit As String = GetHexDigit(remainder)

            ' Prepend the hexadecimal digit to the result string
            hexResult = hexDigit & hexResult

            ' Divide the decimal number by 16 to get the next digit
            decimalNumber \= 16
        End While

        ' Return the final hexadecimal result
        Return hexResult
    End Function

    ' Function to get the hexadecimal digit for a given remainder
    Function GetHexDigit(ByVal remainder As Integer) As String
        ' Array of hexadecimal digits
        Dim hexDigits() As String = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"}

        ' Return the corresponding hexadecimal digit
        Return hexDigits(remainder)
    End Function

    Sub Main()
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")

        ' Read the user input and