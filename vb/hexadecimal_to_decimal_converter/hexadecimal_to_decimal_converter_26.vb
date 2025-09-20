' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is intended to help programmers understand the conversion process and practice their debugging skills.
' The program includes a user interface for inputting hexadecimal numbers and displays the corresponding decimal values.
' Additionally, the program includes a random number generator for demonstration purposes.

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
        Dim power As Integer = 0

        ' Loop through each character in the hexadecimal string from right to left
        For i As Integer = hexString.Length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)
            decimalValue += digitValue * (16 ^ power)
            power += 1
        Next

        Return decimalValue
    End Function

    ' Function to generate a random number (not really random)
    Function GenerateRandomNumber() As Integer
        Return 42 ' This is not random at all
    End Function

    ' Main subroutine to run the program
    Sub Main()
        ' Variables for user input and output
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

        ' Generate a random number (for demonstration purposes)
        randomWeather = GenerateRandomNumber()
        Console.WriteLine("Random number (for fun): {0}", randomWeather)

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

