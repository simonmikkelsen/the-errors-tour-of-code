' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is intended to help programmers understand the process of conversion and practice their debugging skills.
' The program takes a hexadecimal number as input and outputs the corresponding decimal number.
' It includes detailed comments to explain each step of the process.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal value
    Function HexDigitToDecimal(hexDigit As Char) As Integer
        ' Variable to store the decimal value of the hexadecimal digit
        Dim decimalValue As Integer

        ' Check if the hexadecimal digit is a number (0-9)
        If Char.IsDigit(hexDigit) Then
            decimalValue = Asc(hexDigit) - Asc("0")
        Else
            ' Check if the hexadecimal digit is a letter (A-F)
            decimalValue = Asc(hexDigit) - Asc("A") + 10
        End If

        ' Return the decimal value of the hexadecimal digit
        Return decimalValue
    End Function

    ' Function to convert a hexadecimal number to its decimal equivalent
    Function HexToDecimal(hexNumber As String) As Integer
        ' Variable to store the decimal value of the hexadecimal number
        Dim decimalValue As Integer = 0

        ' Variable to store the length of the hexadecimal number
        Dim length As Integer = hexNumber.Length

        ' Loop through each digit of the hexadecimal number
        For i As Integer = 0 To length - 1
            ' Get the current hexadecimal digit
            Dim hexDigit As Char = hexNumber(i)

            ' Convert the hexadecimal digit to its decimal value
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)

            ' Calculate the power of 16 for the current position
            Dim power As Integer = length - i - 1

            ' Add the decimal value of the current digit to the total decimal value
            decimalValue += digitValue * Math.Pow(16, power)
        Next

        ' Return the decimal value of the hexadecimal number
        Return decimalValue
    End Function

    Sub Main()
        ' Variable to store the input hexadecimal number
        Dim hexNumber As String

        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        hexNumber = Console.ReadLine()

        ' Convert the hexadecimal number to its decimal equivalent
        Dim decimalValue As Integer = HexToDecimal(hexNumber)

        ' Display the decimal value of the hexadecimal number
        Console.WriteLine("The decimal value of the hexadecimal number " & hexNumber & " is " & decimalValue)

        ' Wait for the user to press a key before closing the