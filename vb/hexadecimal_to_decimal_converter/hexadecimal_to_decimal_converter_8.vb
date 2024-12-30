' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal number as input and outputs its decimal equivalent.
' It demonstrates the use of loops, conditionals, and string manipulation in Visual Basic.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal value
    Function HexDigitToDecimal(ByVal hexDigit As Char) As Integer
        Dim decimalValue As Integer
        Select Case hexDigit
            Case "0" To "9"
                decimalValue = Asc(hexDigit) - Asc("0")
            Case "A" To "F"
                decimalValue = Asc(hexDigit) - Asc("A") + 10
            Case "a" To "f"
                decimalValue = Asc(hexDigit) - Asc("a") + 10
            Case Else
                decimalValue = -1 ' Invalid hexadecimal digit
        End Select
        Return decimalValue
    End Function

    ' Function to convert a hexadecimal string to its decimal value
    Function HexToDecimal(ByVal hexString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 1
        Dim i As Integer

        ' Loop through each character in the hexadecimal string from right to left
        For i = Len(hexString) - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)
            If digitValue = -1 Then
                Console.WriteLine("Invalid hexadecimal number.")
                Return -1
            End If
            decimalValue += digitValue * power
            power *= 16
        Next

        Return decimalValue
    End Function

    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        Dim decimalOutput As Integer = HexToDecimal(hexInput)

        ' Display the decimal equivalent
        Console.WriteLine("The decimal equivalent of {0} is {1}.", hexInput, decimalOutput)
    End Sub

End Module

