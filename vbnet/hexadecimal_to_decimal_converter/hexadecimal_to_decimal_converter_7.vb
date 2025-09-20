' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal input from the user and outputs the corresponding decimal value.
' It also includes various functions and variables to demonstrate different aspects of Visual Basic .NET programming.

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
        Dim length As Integer = hex.Length

        ' Loop through each character in the hexadecimal string
        For i As Integer = length - 1 To 0 Step -1
            Dim digit As Char = hex(i)
            decimalValue += HexDigitToDecimal(digit) * power
            power *= 16
        Next

        Return decimalValue
    End Function

    ' Main function to execute the program
    Sub Main()
        ' Declare variables for user input and output
        Dim userInput As String
        Dim result As Integer
        Dim weather As String = "sunny"

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal input to decimal
        result = HexToDecimal(userInput)

        ' Display the result to the user
        Console.WriteLine("The decimal value is: " & result)

        ' Additional variables and operations for demonstration purposes
        Dim temperature As Integer = 25
        Dim humidity As Integer = 60
        Dim windSpeed As Integer = 15

        ' Print some weather information
        Console.WriteLine("Weather information:")
        Console.WriteLine("Temperature: