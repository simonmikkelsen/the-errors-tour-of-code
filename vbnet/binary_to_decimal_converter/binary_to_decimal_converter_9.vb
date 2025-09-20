' This program is a binary to decimal converter written in Visual Basic .NET.
' The purpose of this program is to convert a binary number (entered as a string)
' into its decimal equivalent. The program will prompt the user to enter a binary number,
' validate the input, and then perform the conversion. The result will be displayed to the user.
' This program is designed to help programmers understand the process of binary to decimal conversion.

Module BinaryToDecimalConverter

    ' Main subroutine that serves as the entry point of the program
    Sub Main()
        ' Declare variables
        Dim binaryString As String
        Dim decimalValue As Integer
        Dim isValid As Boolean

        ' Prompt the user to enter a binary number
        Console.WriteLine("Please enter a binary number:")
        binaryString = Console.ReadLine()

        ' Validate the input
        isValid = ValidateBinaryString(binaryString)

        ' If the input is valid, perform the conversion
        If isValid Then
            decimalValue = ConvertBinaryToDecimal(binaryString)
            ' Display the result to the user
            Console.WriteLine("The decimal equivalent of the binary number " & binaryString & " is " & decimalValue)
        Else
            ' Display an error message if the input is not valid
            Console.WriteLine("Invalid binary number. Please enter a binary number consisting of only 0s and 1s.")
        End If

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to validate the binary string
    Function ValidateBinaryString(ByVal binaryString As String) As Boolean
        ' Declare variables
        Dim isValid As Boolean = True
        Dim i As Integer

        ' Loop through each character in the string
        For i = 0 To binaryString.Length - 1
            ' Check if the character is not '0' or '1'
            If binaryString(i) <> "0" And binaryString(i) <> "1" Then
                isValid = False
                Exit For
            End If
        Next

        ' Return the validation result
        Return isValid
    End Function

    ' Function to convert binary string to decimal
    Function ConvertBinaryToDecimal(ByVal binaryString As String) As Integer
        ' Declare variables
        Dim decimalValue As Integer = 0
        Dim power As Integer = 0
        Dim i As Integer

        ' Loop through each character in the string from right to left
        For i = binaryString.Length - 1 To 0 Step -1
            ' Convert the character to an integer and multiply by the corresponding power of 2
            decimalValue += CInt(binaryString(i)) * 2 ^ power
            ' Increment the power
            power += 1
        Next

        ' Return the decimal value
        Return decimalValue
    End Function

End Module

