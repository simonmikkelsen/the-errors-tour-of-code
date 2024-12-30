' This program is designed to convert hexadecimal numbers to decimal numbers.
' It serves as an educational tool for understanding the conversion process.
' The program reads a hexadecimal number from the user, processes it, and outputs the corresponding decimal number.
' The code is written in a verbose manner to help new programmers understand each step of the process.

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
    Function HexToDecimal(hex As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 1
        Dim length As Integer = hex.Length

        ' Loop through each character in the hexadecimal string
        For i As Integer = length - 1 To 0 Step -1
            Dim currentDigit As Char = hex(i)
            Dim decimalDigit As Integer = HexDigitToDecimal(currentDigit)
            decimalValue += decimalDigit * power
            power *= 16
        Next

        Return decimalValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Variable to store the user's input
        Dim userInput As String
        ' Variable to store the result of the conversion
        Dim result As Integer

        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        result = HexToDecimal(userInput)

        ' Display the result to the user
        Console.WriteLine("The decimal equivalent is: " & result)

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

