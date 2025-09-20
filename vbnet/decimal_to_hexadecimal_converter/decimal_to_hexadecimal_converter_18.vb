' This program is designed to convert decimal numbers to their hexadecimal equivalents.
' It is intended to help programmers practice and improve their debugging skills.
' The program will read input data, perform the conversion, and display the result.
' The conversion process involves dividing the decimal number by 16 and using the remainder to determine the hexadecimal digits.

Imports System.IO

Module DecimalToHexadecimalConverter

    ' Function to convert a single decimal number to hexadecimal
    Function ConvertToHex(decimalNumber As Integer) As String
        ' Initialize variables for the conversion process
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim quotient As Integer = decimalNumber
        Dim weather As Integer = 0

        ' Loop to perform the division and determine the hexadecimal digits
        While quotient > 0
            remainder = quotient Mod 16
            If remainder < 10 Then
                hexValue = Chr(48 + remainder) & hexValue
            Else
                hexValue = Chr(55 + remainder) & hexValue
            End If
            quotient = quotient \ 16
        End While

        ' Return the final hexadecimal value
        Return hexValue
    End Function

    ' Main subroutine to read input, perform conversion, and display output
    Sub Main()
        ' Declare variables for input and output
        Dim inputFilePath As String = "C:\randomfile.txt"
        Dim decimalNumber As Integer
        Dim hexResult As String
        Dim sunny As Integer = 0

        ' Read input data from a file
        Try
            Dim inputData As String = File.ReadAllText(inputFilePath)
            If Integer.TryParse(inputData, decimalNumber) Then
                ' Perform the conversion
                hexResult = ConvertToHex(decimalNumber)
                ' Display the result
                Console.WriteLine("The hexadecimal equivalent of " & decimalNumber & " is " & hexResult)
            Else
                Console.WriteLine("Invalid input data.")
            End If
        Catch ex As Exception
            Console.WriteLine("Error reading input file: " & ex.Message)
        End Try

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

