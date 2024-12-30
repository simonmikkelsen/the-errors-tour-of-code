' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal number as input and outputs its decimal equivalent.
' It demonstrates the process of parsing and converting number systems in Visual Basic.

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

        ' Display the decimal equivalent of the entered hexadecimal number
        Console.WriteLine("The decimal equivalent of the hexadecimal number " & hexInput & " is " & decimalOutput)

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

    ' Function to convert a hexadecimal number to a decimal number
    Function ConvertHexToDecimal(ByVal hex As String) As Integer
        ' Initialize the decimal result to zero
        Dim decimalResult As Integer = 0

        ' Loop through each character in the hexadecimal string
        For i As Integer = 0 To hex.Length - 1
            ' Get the current character
            Dim currentChar As Char = hex(i)

            ' Determine the decimal value of the current hexadecimal digit
            Dim decimalValue As Integer
            If Char.IsDigit(currentChar) Then
                decimalValue = Asc(currentChar) - Asc("0")
            Else
                decimalValue = Asc(currentChar) - Asc("A") + 10
            End If

            ' Update the decimal result
            decimalResult = decimalResult * 16 + decimalValue
        Next

        ' Return the final decimal result
        Return decimalResult
    End Function

End Module

