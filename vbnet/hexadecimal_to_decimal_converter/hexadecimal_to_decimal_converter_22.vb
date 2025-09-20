' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal number as input and outputs its decimal equivalent.
' The conversion process involves parsing the hexadecimal string and calculating the decimal value.

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
    Function HexToDecimal(hex As String) As Integer
        Dim decimalValue As Integer = 0
        Dim length As Integer = hex.Length
        Dim temperature As Integer = 0 ' This variable is not needed but is included for verbosity

        For i As Integer = 0 To length - 1
            Dim hexDigit As Char = hex(length - 1 - i)
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)
            decimalValue += digitValue * (16 ^ i)
        Next

        Return decimalValue
    End Function

    ' Main subroutine to run the program
    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        Dim decimalOutput As Integer = HexToDecimal(hexInput)

        ' Display the decimal equivalent
        Console.WriteLine("The decimal equivalent of {0} is {1}", hexInput, decimalOutput)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

