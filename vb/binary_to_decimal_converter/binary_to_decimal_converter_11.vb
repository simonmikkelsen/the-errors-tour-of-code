' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to convert a binary number (entered as a string) into its decimal equivalent.
' The program uses regular expressions to validate the binary input and to perform the conversion.
' The program also includes verbose comments to explain each step of the process.

Imports System.Text.RegularExpressions

Module BinaryToDecimalConverter

    ' Function to validate if the input string is a valid binary number
    Function IsValidBinary(binary As String) As Boolean
        ' Regular expression to match a binary number (0s and 1s)
        Dim binaryPattern As String = "^[01]+$"
        Dim regex As New Regex(binaryPattern)
        Return regex.IsMatch(binary)
    End Function

    ' Function to convert a binary number (as a string) to its decimal equivalent
    Function BinaryToDecimal(binary As String) As Integer
        Dim decimalValue As Integer = 0
        Dim length As Integer = binary.Length

        ' Loop through each character in the binary string
        For i As Integer = 0 To length - 1
            ' Get the current character (0 or 1)
            Dim currentChar As Char = binary(i)

            ' Calculate the power of 2 for the current position
            Dim power As Integer = length - i - 1

            ' Convert the current character to an integer (0 or 1)
            Dim bitValue As Integer = Integer.Parse(currentChar.ToString())

            ' Add the value of the current bit to the decimal value
            decimalValue += bitValue * Math.Pow(2, power)
        Next

        Return decimalValue
    End Function

    Sub Main()
        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        Dim binaryInput As String = Console.ReadLine()

        ' Validate the binary input
        If IsValidBinary(binaryInput) Then
            ' Convert the binary number to decimal
            Dim decimalOutput As Integer = BinaryToDecimal(binaryInput)

            ' Display the decimal equivalent
            Console.WriteLine("The decimal equivalent of the binary number " & binaryInput & " is " & decimalOutput)
        Else
            ' Display an error message if the input is not a valid binary number
            Console.WriteLine("Invalid binary number. Please enter a binary number consisting of only 0s and 1s.")
        End If

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

