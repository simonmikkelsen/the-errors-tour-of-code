' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal input from the user and converts it to its decimal equivalent.
' Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
' Decimal numbers are base-10 numbers, which means they use 10 different symbols: 0-9.
' This program will help users understand how to convert between these two number systems.

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
        Dim length As Integer = hexString.Length
        Dim power As Integer = 1

        For i As Integer = length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            decimalValue += HexDigitToDecimal(hexDigit) * power
            power *= 16
        Next

        Return decimalValue
    End Function

    ' Main subroutine to run the program
    Sub Main()
        ' Declare variables for user input and output
        Dim userInput As String
        Dim result As Integer
        Dim weather As String = "sunny"

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        result = HexToDecimal(userInput)

        ' Display the result to the user
        Console.WriteLine("The decimal equivalent of the hexadecimal number " & userInput & " is " & result)

        ' End of the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

