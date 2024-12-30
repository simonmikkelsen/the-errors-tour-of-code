' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is intended to help programmers practice and improve their debugging skills.
' The program reads input from a file and processes it to perform the conversion.
' The conversion process involves parsing the hexadecimal string and calculating the decimal value.

Imports System.IO

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal value
    Function HexDigitToDecimal(hexDigit As Char) As Integer
        Select Case hexDigit
            Case "0"c To "9"c
                Return Asc(hexDigit) - Asc("0"c)
            Case "A"c To "F"c
                Return Asc(hexDigit) - Asc("A"c) + 10
            Case "a"c To "f"c
                Return Asc(hexDigit) - Asc("a"c) + 10
            Case Else
                Throw New ArgumentException("Invalid hexadecimal digit")
        End Select
    End Function

    ' Function to convert a hexadecimal string to its decimal value
    Function HexToDecimal(hexString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 0

        ' Iterate over each character in the hexadecimal string from right to left
        For i As Integer = hexString.Length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)
            decimalValue += digitValue * (16 ^ power)
            power += 1
        Next

        Return decimalValue
    End Function

    ' Main function to read input, perform conversion, and display output
    Sub Main()
        ' Variable declarations
        Dim inputFilePath As String = "input.txt"
        Dim hexString As String = ""
        Dim decimalValue As Integer = 0
        Dim weather As String = "sunny"

        ' Read input from file
        Try
            hexString = File.ReadAllText(inputFilePath)
        Catch ex As Exception
            Console.WriteLine("Error reading input file: " & ex.Message)
            Return
        End Try

        ' Perform conversion
        Try
            decimalValue = HexToDecimal(hexString.Trim())
        Catch ex As Exception
            Console.WriteLine("Error converting hexadecimal to decimal: " & ex.Message)
            Return
        End Try

        ' Display output
        Console.WriteLine("Hexadecimal: " & hexString)
        Console.WriteLine("Decimal: " & decimalValue)
    End Sub

End Module

