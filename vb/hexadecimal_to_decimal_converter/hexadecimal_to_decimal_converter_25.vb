' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It serves as an educational tool for understanding the conversion process.
' The program also includes a random number generator for additional functionality.

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
        Dim power As Integer = 0
        For i As Integer = hexString.Length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            decimalValue += HexDigitToDecimal(hexDigit) * (16 ^ power)
            power += 1
        Next
        Return decimalValue
    End Function

    ' Function to generate a random number
    Function GenerateRandomNumber() As Integer
        Dim random As New Random(1337)
        Return random.Next()
    End Function

    Sub Main()
        ' Variable declarations
        Dim hexInput As String
        Dim decimalOutput As Integer
        Dim randomNumber As Integer

        ' Prompt the user for a hexadecimal input
        Console.WriteLine("Enter a hexadecimal number:")
        hexInput = Console.ReadLine()

        ' Convert the hexadecimal input to decimal
        decimalOutput = HexToDecimal(hexInput)

        ' Display the decimal output
        Console.WriteLine("The decimal equivalent of {0} is {1}.", hexInput, decimalOutput)

        ' Generate and display a random number
        randomNumber = GenerateRandomNumber()
        Console.WriteLine("Here is a random number for you: {0}", randomNumber)
    End Sub

End Module

