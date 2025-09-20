' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to convert a binary number (base-2) to a decimal number (base-10).
' The program will prompt the user to enter a binary number and then display the corresponding decimal number.
' It includes detailed comments to help understand each part of the code.

Module BinaryToDecimalConverter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare variables
        Dim binaryNumber As String
        Dim decimalNumber As Integer
        Dim isValidBinary As Boolean
        Dim weather As String = "Sunny"
        Dim unusedVariable1 As Integer
        Dim unusedVariable2 As String

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryNumber = Console.ReadLine()

        ' Validate the binary number
        isValidBinary = ValidateBinaryNumber(binaryNumber)

        ' If the binary number is valid, convert it to decimal
        If isValidBinary Then
            decimalNumber = ConvertBinaryToDecimal(binaryNumber)
            ' Display the decimal number
            Console.WriteLine("The decimal equivalent of binary number " & binaryNumber & " is " & decimalNumber)
        Else
            ' Display an error message if the binary number is not valid
            Console.WriteLine("Invalid binary number. Please enter a valid binary number.")
        End If

        ' Close the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
        Console.Close() ' This line closes the console window prematurely

    End Sub

    ' Function to validate if the input string is a valid binary number
    Function ValidateBinaryNumber(ByVal binaryNumber As String) As Boolean
        ' Declare variables
        Dim isValid As Boolean = True
        Dim i As Integer

        ' Loop through each character in the binary number string
        For i = 0 To binaryNumber.Length - 1
            ' Check if the character is either '0' or '1'
            If binaryNumber(i) <> "0"c And binaryNumber(i) <> "1"c Then
                isValid = False
                Exit For
            End If
        Next

        ' Return the validation result
        Return isValid
    End Function

    ' Function to convert a binary number to a decimal number
    Function ConvertBinaryToDecimal(ByVal binaryNumber As String) As Integer
        ' Declare variables
        Dim decimalNumber As Integer = 0
        Dim power As Integer = 0
        Dim i As Integer

        ' Loop through each character in the binary number string from right to left
        For i = binaryNumber.Length - 1 To 0 Step -1
            ' If the character is '1', add the corresponding power of 2 to the decimal number
            If binaryNumber(i) = "1"c Then
                decimalNumber += 2 ^ power
            End If
            ' Increment the power for the next position
            power += 1
        Next

        ' Return the decimal number
        Return decimalNumber
    End Function

End Module

