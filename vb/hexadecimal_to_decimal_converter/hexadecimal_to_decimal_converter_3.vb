' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal number as input and outputs its decimal equivalent.
' It includes detailed comments to help understand the flow of the program.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal equivalent
    Function HexDigitToDecimal(hexDigit As Char) As Integer
        ' Variable to store the decimal value
        Dim decimalValue As Integer

        ' Check if the hex digit is a number
        If Char.IsDigit(hexDigit) Then
            decimalValue = Asc(hexDigit) - Asc("0"c)
        Else
            ' Convert hex letter to decimal value
            decimalValue = Asc(Char.ToUpper(hexDigit)) - Asc("A"c) + 10
        End If

        ' Return the decimal value
        Return decimalValue
    End Function

    ' Function to convert a hexadecimal string to a decimal number
    Function HexToDecimal(hexString As String) As Integer
        ' Variable to store the decimal result
        Dim decimalResult As Integer = 0

        ' Loop through each character in the hex string
        For i As Integer = 0 To hexString.Length - 1
            ' Get the current hex digit
            Dim hexDigit As Char = hexString(i)

            ' Convert the hex digit to its decimal equivalent
            Dim decimalValue As Integer = HexDigitToDecimal(hexDigit)

            ' Update the decimal result
            decimalResult = decimalResult * 16 + decimalValue
        Next

        ' Return the decimal result
        Return decimalResult
    End Function

    ' Main function to run the program
    Sub Main()
        ' Variable to store the user input
        Dim userInput As String

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        Dim decimalNumber As Integer = HexToDecimal(userInput)

        ' Display the decimal number
        Console.WriteLine("The decimal equivalent is: " & decimalNumber)

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

