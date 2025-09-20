' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal input from the user and outputs the corresponding decimal value.
' It includes various functions and variables to demonstrate different aspects of Visual Basic .NET programming.

Module HexToDecimalConverter

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
        Dim length As Integer = hexString.Length

        For i As Integer = 0 To length - 1
            Dim hexDigit As Char = hexString(i)
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)
            decimalValue = decimalValue * 16 + digitValue
        Next

        Return decimalValue
    End Function

    ' Main function to execute the program
    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Convert the hexadecimal input to decimal
        Dim decimalOutput As Integer = HexToDecimal(hexInput)

        ' Display the decimal output
        Console.WriteLine("The decimal equivalent is: " & decimalOutput)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

