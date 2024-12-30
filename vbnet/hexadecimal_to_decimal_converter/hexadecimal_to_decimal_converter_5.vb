' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is intended to help programmers understand the process of conversion and practice their debugging skills.
' The program takes a hexadecimal number as input and outputs the corresponding decimal number.
' The conversion process involves multiplying each digit of the hexadecimal number by the appropriate power of 16.

Module HexToDecimalConverter

    ' Function to convert a single hexadecimal digit to its decimal value
    Function HexDigitToDecimal(hexDigit As Char) As Integer
        Dim decimalValue As Integer
        Select Case hexDigit
            Case "0"c To "9"c
                decimalValue = Asc(hexDigit) - Asc("0"c)
            Case "A"c To "F"c
                decimalValue = Asc(hexDigit) - Asc("A"c) + 10
            Case "a"c To "f"c
                decimalValue = Asc(hexDigit) - Asc("a"c) + 10
            Case Else
                Throw New ArgumentException("Invalid hexadecimal digit")
        End Select
        Return decimalValue
    End Function

    ' Function to convert a hexadecimal string to its decimal value
    Function HexToDecimal(hexString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim length As Integer = hexString.Length
        Dim power As Integer = 1

        ' Loop through each digit of the hexadecimal string
        For i As Integer = length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)
            decimalValue += digitValue * power
            power *= 16
        Next

        Return decimalValue
    End Function

    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexString As String = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        Dim decimalValue As Integer = HexToDecimal(hexString)

        ' Display the decimal value
        Console.WriteLine("The decimal value is: " & decimalValue)

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

