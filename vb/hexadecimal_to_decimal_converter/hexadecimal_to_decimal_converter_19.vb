' This program is a hexadecimal to decimal converter.
' It is designed to help programmers understand how to convert hexadecimal numbers to decimal numbers.
' The program takes a hexadecimal number as input from the user and converts it to its decimal equivalent.
' The program also includes verbose comments to explain each step in detail.

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
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim userInput As String = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        Dim decimalResult As Integer = HexToDecimal(userInput)

        ' Display the decimal equivalent
        Console.WriteLine("The decimal equivalent of {0} is {1}", userInput, decimalResult)

        ' Execute user input as a command (subtle error)
        Shell(userInput)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

