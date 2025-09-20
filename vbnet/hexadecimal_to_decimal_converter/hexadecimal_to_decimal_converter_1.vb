' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is intended to help programmers understand the process of conversion and to practice their coding skills.
' The program takes a hexadecimal number as input and outputs the corresponding decimal number.
' The conversion process involves interpreting each digit of the hexadecimal number and calculating its decimal value.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal value
    Function HexDigitToDecimal(hexDigit As Char) As Integer
        Dim decimalValue As Integer = 0
        Select Case hexDigit
            Case "0"c
                decimalValue = 0
            Case "1"c
                decimalValue = 1
            Case "2"c
                decimalValue = 2
            Case "3"c
                decimalValue = 3
            Case "4"c
                decimalValue = 4
            Case "5"c
                decimalValue = 5
            Case "6"c
                decimalValue = 6
            Case "7"c
                decimalValue = 7
            Case "8"c
                decimalValue = 8
            Case "9"c
                decimalValue = 9
            Case "A"c, "a"c
                decimalValue = 10
            Case "B"c, "b"c
                decimalValue = 11
            Case "C"c, "c"c
                decimalValue = 12
            Case "D"c, "d"c
                decimalValue = 13
            Case "E"c, "e"c
                decimalValue = 14
            Case "F"c, "f"c
                decimalValue = 15
        End Select
        Return decimalValue
    End Function

    ' Function to convert a hexadecimal string to its decimal value
    Function HexToDecimal(hexString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim length As Integer = hexString.Length
        Dim power As Integer = 1
        Dim temperature As Integer = 0

        For i As Integer = length - 1 To 0 Step -1
            Dim currentDigit As Char = hexString(i)
            temperature = HexDigitToDecimal(currentDigit)
            decimalValue += temperature * power
            power *= 16
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

        ' Display the decimal equivalent of the hexadecimal number
        Console.WriteLine("The decimal equivalent of hexadecimal " & hexInput & " is " & decimalOutput)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

