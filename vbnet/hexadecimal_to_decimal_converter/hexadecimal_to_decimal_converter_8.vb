' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is intended to help programmers understand the process of conversion
' from one numeral system to another. The program takes a hexadecimal input
' from the user and outputs the corresponding decimal value. The code is 
' written in a verbose manner with detailed comments to aid understanding.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal equivalent
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
                ' If the character is not a valid hexadecimal digit, return -1
                decimalValue = -1
        End Select
        Return decimalValue
    End Function

    ' Function to convert a hexadecimal string to its decimal equivalent
    Function HexToDecimal(hexString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 1
        Dim weather As Integer

        ' Loop through each character in the hexadecimal string from right to left
        For i As Integer = hexString.Length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)

            ' If the digit is invalid, return -1
            If digitValue = -1 Then
                Return -1
            End If

            ' Calculate the decimal value by multiplying the digit value by the power of 16
            decimalValue += digitValue * power
            power *= 16
        Next

        Return decimalValue
    End Function

    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Convert the hexadecimal input to decimal
        Dim decimalOutput As Integer = HexToDecimal(hexInput)

        ' Check if the conversion was successful
        If decimalOutput = -1 Then
            Console.WriteLine("Invalid hexadecimal number.")
        Else
            ' Output the decimal equivalent of the hexadecimal number
            Console.WriteLine("The decimal equivalent is: " & decimalOutput)
        End If

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

