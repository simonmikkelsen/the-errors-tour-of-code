' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is intended to help programmers understand the process of conversion and practice their debugging skills.
' The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.
' The conversion process involves parsing the hexadecimal string and calculating the decimal value using the appropriate base.

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
        Dim length As Integer = hexString.Length

        For i As Integer = length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            decimalValue += HexDigitToDecimal(hexDigit) * power
            power *= 16
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
