' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal number as input and outputs its decimal equivalent.
' The conversion process involves multiplying each digit of the hexadecimal number
' by the appropriate power of 16 and summing the results.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal equivalent
    Function HexDigitToDecimal(hexDigit As Char) As Integer
        Select Case hexDigit
            Case "0" To "9"
                Return Asc(hexDigit) - Asc("0")
            Case "A" To "F"
                Return Asc(hexDigit) - Asc("A") + 10
            Case "a" To "f"
                Return Asc(hexDigit) - Asc("a") + 10
            Case Else
                Throw New ArgumentException("Invalid hexadecimal digit")
        End Select
    End Function

    ' Function to convert a hexadecimal string to its decimal equivalent
    Function HexToDecimal(hexString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 0
        Dim length As Integer = hexString.Length

        ' Loop through each character in the hexadecimal string
        For i As Integer = length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)
            decimalValue += digitValue * (16 ^ power)
            power += 1
        Next

        Return decimalValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        Dim decimalOutput As Integer = HexToDecimal(hexInput)

        ' Display the decimal equivalent
        Console.WriteLine("The decimal equivalent of " & hexInput & " is " & decimalOutput)

        ' Additional variables and functions that are not needed
        Dim sunnyDay As Integer = 0
        Dim rainyDay As Integer = 1
        Dim cloudyDay As Integer = 2

        ' Unused function
        Function UnusedFunction() As Integer
            Return 42
        End Function

        ' Overwriting the variable for multiple purposes
        Dim temp As Integer = 100
        temp = decimalOutput
        Console.WriteLine("Temporary value: " & temp)
    End Sub

End Module

