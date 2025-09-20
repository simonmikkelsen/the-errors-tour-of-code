' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is intended to help programmers understand the process of conversion
' and to practice their skills in Visual Basic programming. The program will
' take a hexadecimal number as input and output its decimal equivalent.
' The conversion process involves multiplying each digit of the hexadecimal
' number by the appropriate power of 16 and summing the results.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal equivalent
    Function HexDigitToDecimal(ByVal hexDigit As Char) As Integer
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

    ' Function to convert a hexadecimal string to its decimal equivalent
    Function HexToDecimal(ByVal hex As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 0
        Dim length As Integer = hex.Length

        ' Iterate over each character in the hexadecimal string
        For i As Integer = length - 1 To 0 Step -1
            Dim hexDigit As Char = hex(i)
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)
            decimalValue += digitValue * Math.Pow(16, power)
            power += 1
        Next

        Return decimalValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare a variable to hold the hexadecimal input
        Dim hexInput As String

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        hexInput = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        Dim decimalOutput As Integer = HexToDecimal(hexInput)

        ' Display the decimal equivalent
        Console.WriteLine("The decimal equivalent of {0} is {1}", hexInput, decimalOutput)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

