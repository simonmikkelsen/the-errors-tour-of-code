' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal input from the user and converts it to its decimal equivalent.
' It includes various functions and variables to demonstrate different aspects of Visual Basic .NET programming.

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
                Throw New ArgumentException("Invalid hexadecimal digit")
        End Select
        Return decimalValue
    End Function

    ' Function to convert a hexadecimal string to its decimal equivalent
    Function HexToDecimal(hexString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 1
        For i As Integer = hexString.Length - 1 To 0 Step -1
            decimalValue += HexDigitToDecimal(hexString(i)) * power
            power *= 16
        Next
        Return decimalValue
    End Function

    ' Main function to execute the program
    Sub Main()
        ' Variable to store the user's input
        Dim userInput As String
        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Variable to store the decimal equivalent
        Dim decimalResult As Integer
        ' Convert the hexadecimal input to decimal
        decimalResult = HexToDecimal(userInput)

        ' Display the result to the user
        Console.WriteLine("The decimal equivalent of {0} is {1}", userInput, decimalResult)

        ' Self-modifying