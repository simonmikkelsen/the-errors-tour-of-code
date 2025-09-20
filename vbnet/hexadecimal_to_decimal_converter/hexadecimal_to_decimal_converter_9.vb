' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal number as input and outputs the corresponding decimal number.
' It demonstrates the use of various programming constructs in Visual Basic .NET.

Module HexToDecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the hexadecimal input from the user
        Dim hexInput As String

        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Please enter a hexadecimal number:")
        hexInput = Console.ReadLine()

        ' Call the function to convert the hexadecimal number to decimal
        Dim decimalOutput As Integer = ConvertHexToDecimal(hexInput)

        ' Display the result to the user
        Console.WriteLine("The decimal equivalent of the hexadecimal number " & hexInput & " is " & decimalOutput)

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a hexadecimal number to its decimal equivalent
    Function ConvertHexToDecimal(ByVal hex As String) As Integer
        ' Declare a variable to store the decimal result
        Dim decimalResult As Integer = 0

        ' Declare a variable to store the length of the hexadecimal input
        Dim length As Integer = hex.Length

        ' Loop through each character in the hexadecimal input
        For i As Integer = 0 To length - 1
            ' Get the current character
            Dim currentChar As Char = hex(i)

            ' Declare a variable to store the value of the current character
            Dim currentValue As Integer

            ' Check if the current character is a digit
            If Char.IsDigit(currentChar) Then
                ' Convert the character to its numeric value
                currentValue = Convert.ToInt32(currentChar.ToString())
            Else
                ' Convert the character to its corresponding hexadecimal value
                currentValue = Asc(currentChar) - Asc("A"c) + 10
            End If

            ' Update the decimal result
            decimalResult += currentValue * Math.Pow(16, length - i - 1)
        Next

        ' Return the decimal result
        Return decimalResult
    End Function

End Module

