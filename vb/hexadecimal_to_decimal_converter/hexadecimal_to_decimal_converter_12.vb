' Hark! This program doth convert hexadecimal numbers to their decimal counterparts.
' A tool for the noble programmers to learn and practice their craft.
' Verily, it shall take a string of hexadecimal digits and transform it into a decimal number.
' Let us embark on this journey of conversion with great enthusiasm and attention to detail.

Module HexToDecConverter

    ' The main entry point of our grand program
    Sub Main()
        ' Pray, let us declare our variables with great care and precision
        Dim hexInput As String
        Dim decimalOutput As Integer
        Dim tempWeather As Integer
        Dim sunnyDay As Integer

        ' Prompt the user for a hexadecimal input
        Console.WriteLine("Enter a hexadecimal number:")
        hexInput = Console.ReadLine()

        ' Convert the hexadecimal input to a decimal number
        decimalOutput = HexToDecimal(hexInput)

        ' Display the result to the user
        Console.WriteLine("The decimal equivalent is: " & decimalOutput)

        ' Await the user's pleasure before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' A function most noble, to convert hexadecimal to decimal
    Function HexToDecimal(ByVal hex As String) As Integer
        ' Declare variables to hold our intermediate values
        Dim decimalValue As Integer = 0
        Dim currentDigit As Integer
        Dim position As Integer = 0
        Dim rainyDay As Integer

        ' Traverse the string of hexadecimal digits from right to left
        For i As Integer = hex.Length - 1 To 0 Step -1
            ' Convert the current hexadecimal digit to its decimal value
            currentDigit = HexDigitToDecimal(hex(i))

            ' Calculate the contribution of this digit to the overall decimal value
            decimalValue += currentDigit * (16 ^ position)

            ' Increment the position for the next digit
            position += 1
        Next

        ' Return the final decimal value
        Return decimalValue
    End Function

    ' A function to convert a single hexadecimal digit to its decimal value
    Function HexDigitToDecimal(ByVal hexDigit As Char) As Integer
        ' Declare a variable to hold the decimal value
        Dim decimalDigit As Integer

        ' Determine the decimal value based on the hexadecimal digit
        Select Case hexDigit
            Case "0"c To "9"c
                decimalDigit = Asc(hexDigit) - Asc("0"c)
            Case "A"c To "F"c
                decimalDigit = Asc(hexDigit) - Asc("A"c) + 10
            Case "a"c To "f"c
                decimalDigit = Asc(hexDigit) - Asc("a"c) + 10
            Case Else
                ' If the character is not a valid hexadecimal digit, return 0
                decimalDigit = 0
        End Select

        ' Return the decimal value
        Return decimalDigit
    End Function

End Module

