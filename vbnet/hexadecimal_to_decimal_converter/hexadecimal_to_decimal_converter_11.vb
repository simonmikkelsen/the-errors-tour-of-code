' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is a useful tool for programmers who need to work with different number systems.
' The program uses regular expressions to validate and process the input.
' The user will be prompted to enter a hexadecimal number, and the program will output the corresponding decimal number.

Imports System.Text.RegularExpressions

Module HexToDecimalConverter

    ' Function to validate if the input is a valid hexadecimal number
    Function IsValidHex(hex As String) As Boolean
        ' Regular expression pattern for a valid hexadecimal number
        Dim hexPattern As String = "^[0-9A-Fa-f]+$"
        Dim regex As New Regex(hexPattern)
        Return regex.IsMatch(hex)
    End Function

    ' Function to convert a single hexadecimal digit to its decimal equivalent
    Function HexDigitToDecimal(digit As Char) As Integer
        Select Case digit
            Case "0"c To "9"c
                Return Asc(digit) - Asc("0"c)
            Case "A"c To "F"c
                Return Asc(digit) - Asc("A"c) + 10
            Case "a"c To "f"c
                Return Asc(digit) - Asc("a"c) + 10
            Case Else
                Throw New ArgumentException("Invalid hexadecimal digit")
        End Select
    End Function

    ' Function to convert a hexadecimal number to its decimal equivalent
    Function HexToDecimal(hex As String) As Integer
        Dim decimalValue As Integer = 0
        Dim length As Integer = hex.Length

        ' Iterate over each character in the hexadecimal string
        For i As Integer = 0 To length - 1
            Dim digit As Char = hex(i)
            Dim decimalDigit As Integer = HexDigitToDecimal(digit)
            decimalValue = decimalValue * 16 + decimalDigit
        Next

        Return decimalValue
    End Function

    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Validate the input
        If IsValidHex(hexInput) Then
            ' Convert the hexadecimal number to decimal
            Dim decimalOutput As Integer = HexToDecimal(hexInput)
            ' Display the result
            Console.WriteLine("The decimal equivalent is: " & decimalOutput)
        Else
            ' Display an error message for invalid input
            Console.WriteLine("Invalid hexadecimal number.")
        End If

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

