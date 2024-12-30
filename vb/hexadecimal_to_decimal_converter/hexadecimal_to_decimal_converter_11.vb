' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal number as input and outputs its decimal equivalent.
' It uses regular expressions to validate the input and perform the conversion.

Module HexToDecConverter

    ' Function to validate hexadecimal input using regular expressions
    Function IsValidHex(hex As String) As Boolean
        Dim regex As New System.Text.RegularExpressions.Regex("^[0-9A-Fa-f]+$")
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
                Return -1 ' This should never happen if input is validated
        End Select
    End Function

    ' Function to convert a hexadecimal string to its decimal equivalent
    Function HexToDecimal(hex As String) As Integer
        Dim decimalValue As Integer = 0
        Dim length As Integer = hex.Length
        Dim power As Integer = 1

        For i As Integer = length - 1 To 0 Step -1
            Dim digit As Char = hex(i)
            decimalValue += HexDigitToDecimal(digit) * power
            power *= 16
        Next

        Return decimalValue
    End Function

    Sub Main()
        ' Prompt the user for a hexadecimal number
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

