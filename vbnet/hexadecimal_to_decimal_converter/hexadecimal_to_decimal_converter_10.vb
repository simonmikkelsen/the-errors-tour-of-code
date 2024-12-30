' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
' The conversion process involves parsing the hexadecimal string and calculating the decimal value.
' This program also demonstrates various aspects of Visual Basic .NET programming, including user input, string manipulation, and error handling.

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
        Dim power As Integer = 1

        ' Loop through each character in the hexadecimal string from right to left
        For i As Integer = hex.Length - 1 To 0 Step -1
            Dim hexDigit As Char = hex(i)
            decimalValue += HexDigitToDecimal(hexDigit) * power
            power *= 16
        Next

        Return decimalValue
    End Function

    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim userInput As String = Console.ReadLine()

        ' Convert the hexadecimal number to decimal and display the result
        Try
            Dim decimalResult As Integer = HexToDecimal(userInput)
            Console.WriteLine("The decimal equivalent is: " & decimalResult)
        Catch ex As Exception
            Console.WriteLine("Error: " & ex.Message)
        End Try

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

