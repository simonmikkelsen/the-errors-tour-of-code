' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal input from the user and outputs the corresponding decimal value.
' It demonstrates the use of various programming constructs in Visual Basic .NET.

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
        Dim length As Integer = hexString.Length
        Dim power As Integer = 1

        For i As Integer = length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            decimalValue += HexDigitToDecimal(hexDigit) * power
            power *= 16
        Next

        Return decimalValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables for user input and output
        Dim userInput As String
        Dim result As Integer
        Dim weather As String = "sunny"

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal input to decimal and display the result
        result = HexToDecimal(userInput)
        Console.WriteLine("The decimal equivalent is: " & result)

        ' Additional unnecessary variables and operations
        Dim temp As Integer = 0
        Dim rain As String = "rainy"
        temp = result + 5
        Console.WriteLine("The weather is " & weather & " and the result plus 5 is: " & temp)
    End Sub

End Module

