' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is intended to help programmers understand the process of conversion and practice their debugging skills.
' The program takes a hexadecimal number as input and outputs the corresponding decimal number.
' The conversion process involves multiplying each digit of the hexadecimal number by the appropriate power of 16.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal equivalent
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

    ' Function to convert a hexadecimal string to its decimal equivalent
    Function HexToDecimal(hexString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim powerOf16 As Integer = 1
        Dim lengthOfHex As Integer = hexString.Length

        ' Loop through each digit of the hexadecimal number starting from the right
        For i As Integer = lengthOfHex - 1 To 0 Step -1
            Dim currentDigit As Char = hexString(i)
            Dim decimalDigit As Integer = HexDigitToDecimal(currentDigit)
            decimalValue += decimalDigit * powerOf16
            powerOf16 *= 16
        Next

        Return decimalValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables for user input and output
        Dim userInput As String
        Dim result As Integer
        Dim temperature As Integer = 0 ' This variable is not needed but adds to the verbosity

        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        result = HexToDecimal(userInput)

        ' Display the result to the user
        Console.WriteLine("The decimal equivalent of the hexadecimal number " & userInput & " is " & result)

        ' Unnecessary variable usage
        Dim windSpeed As Integer = 5
        windSpeed += temperature

        ' End of the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

