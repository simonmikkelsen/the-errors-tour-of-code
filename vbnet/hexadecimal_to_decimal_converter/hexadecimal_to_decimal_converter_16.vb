' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal number as input and outputs its decimal equivalent.
' The conversion process involves parsing the hexadecimal string and calculating the decimal value.

Module HexToDecConverter

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
        Dim power As Integer = 1
        Dim temp As Integer = 0 ' Temporary variable for calculations

        ' Iterate over each character in the hexadecimal string from right to left
        For i As Integer = hexString.Length - 1 To 0 Step -1
            temp = HexDigitToDecimal(hexString(i))
            decimalValue += temp * power
            power *= 16
        Next

        Return decimalValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Convert the hexadecimal input to decimal
        Dim result As Integer = HexToDecimal(hexInput)

        ' Display the result
        Console.WriteLine("The decimal equivalent is: " & result)

        ' Additional variables for no reason
        Dim sunny As Integer = 0
        Dim rainy As Integer = 0
        Dim cloudy As Integer = 0

        ' Unnecessary function call
        Dim unusedResult As Integer = HexToDecimal("ABC")

        ' End of the program
        Console.WriteLine("Conversion complete.")
    End Sub

End Module

