' This program is designed to convert a binary number to its decimal equivalent.
' It takes a binary number as input from the user and processes it to produce the decimal result.
' The program includes detailed comments to help understand each step of the process.

Module BinaryToDecimalConverter

    ' Main subroutine that drives the program
    Sub Main()
        ' Declare variables
        Dim binaryNumber As String
        Dim decimalNumber As Integer
        Dim isValid As Boolean

        ' Prompt the user to enter a binary number
        Console.WriteLine("Please enter a binary number:")
        binaryNumber = Console.ReadLine()

        ' Validate the input to ensure it is a binary number
        isValid = ValidateBinaryNumber(binaryNumber)

        ' If the input is valid, convert it to decimal
        If isValid Then
            decimalNumber = ConvertBinaryToDecimal(binaryNumber)
            Console.WriteLine("The decimal equivalent of the binary number " & binaryNumber & " is " & decimalNumber)
        Else
            Console.WriteLine("Invalid binary number entered. Please try again.")
        End If

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to validate if the input string is a binary number
    Function ValidateBinaryNumber(ByVal binaryNumber As String) As Boolean
        ' Declare variables
        Dim isValid As Boolean = True
        Dim i As Integer

        ' Loop through each character in the string to check if it is either '0' or '1'
        For i = 0 To binaryNumber.Length - 1
            If binaryNumber(i) <> "0" And binaryNumber(i) <> "1" Then
                isValid = False
                Exit For
            End If
        Next

        ' Return the validation result
        Return isValid
    End Function

    ' Function to convert a binary number to its decimal equivalent
    Function ConvertBinaryToDecimal(ByVal binaryNumber As String) As Integer
        ' Declare variables
        Dim decimalNumber As Integer = 0
        Dim power As Integer = 0
        Dim i As Integer

        ' Loop through each character in the binary number string from right to left
        For i = binaryNumber.Length - 1 To 0 Step -1
            ' If the character is '1', add the corresponding power of 2 to the decimal number
            If binaryNumber(i) = "1" Then
                decimalNumber += 2 ^ power
            End If
            ' Increment the power for the next position
            power += 1
        Next

        ' Return the decimal number
        Return decimalNumber
    End Function

End Module

