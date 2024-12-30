' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is intended to help programmers practice their debugging skills by providing a working example
' of a hexadecimal to decimal converter. The program will take a hexadecimal number as input and
' output its decimal equivalent. The program includes verbose comments to explain each step in detail.

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

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables for user input and output
        Dim userInput As String
        Dim result As Integer

        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        result = HexToDecimal(userInput)

        ' Display the result to the user
        Console.WriteLine("The decimal equivalent of {0} is {1}", userInput, result)

        ' Close the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
        Console.Close() ' This line closes the console window prematurely
    End Sub

End Module

