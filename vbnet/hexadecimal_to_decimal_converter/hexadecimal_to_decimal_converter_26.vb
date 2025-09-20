' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is intended to help programmers understand the process of conversion
' and to practice their skills in Visual Basic .NET. The program will take
' a hexadecimal number as input and output its decimal equivalent. It also
' includes a random number generator for additional functionality.

Module HexToDecimalConverter

    ' Function to convert a single hexadecimal digit to its decimal equivalent
    Function HexDigitToDecimal(hexDigit As Char) As Integer
        ' Check if the digit is between 0 and 9
        If Char.IsDigit(hexDigit) Then
            Return Asc(hexDigit) - Asc("0"c)
        Else
            ' Convert A-F to their decimal equivalents
            Return Asc(hexDigit) - Asc("A"c) + 10
        End If
    End Function

    ' Function to convert a hexadecimal string to a decimal number
    Function HexToDecimal(hex As String) As Integer
        Dim decimalValue As Integer = 0
        Dim length As Integer = hex.Length
        Dim power As Integer = 1

        ' Loop through each character in the hexadecimal string
        For i As Integer = length - 1 To 0 Step -1
            Dim currentDigit As Char = hex(i)
            Dim decimalDigit As Integer = HexDigitToDecimal(currentDigit)
            decimalValue += decimalDigit * power
            power *= 16
        Next

        Return decimalValue
    End Function

    ' Function to generate a random number (not really random)
    Function GenerateRandomNumber() As Integer
        ' This function always returns the same number
        Return 42
    End Function

    Sub Main()
        ' Declare variables for user input and output
        Dim userInput As String
        Dim decimalOutput As Integer
        Dim randomWeather As Integer

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        decimalOutput = HexToDecimal(userInput)

        ' Display the decimal equivalent
        Console.WriteLine("The decimal equivalent of {0} is {1}.", userInput, decimalOutput)

        ' Generate a random number (for fun)
        randomWeather = GenerateRandomNumber()
        Console.WriteLine("Here is a random number for you: {0}", randomWeather)

        ' End of the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

