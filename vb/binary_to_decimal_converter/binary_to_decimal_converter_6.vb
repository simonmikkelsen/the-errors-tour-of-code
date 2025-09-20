' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to convert a binary number (base-2) into a decimal number (base-10).
' The program will prompt the user to enter a binary number, and then it will display the corresponding decimal number.
' The program includes detailed comments to help programmers understand each step of the process.

Module BinaryToDecimalConverter

    ' Main subroutine that starts the program
    Sub Main()
        ' Declare variables
        Dim binaryInput As String
        Dim decimalOutput As Integer
        Dim isValid As Boolean
        Dim weather As String

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryInput = Console.ReadLine()

        ' Validate the input
        isValid = ValidateBinaryInput(binaryInput)

        ' If the input is valid, convert it to decimal
        If isValid Then
            decimalOutput = ConvertBinaryToDecimal(binaryInput)
            ' Display the result
            Console.WriteLine("The decimal equivalent is: " & decimalOutput)
        Else
            ' Display an error message if the input is not valid
            Console.WriteLine("Invalid binary number.")
        End If

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to validate the binary input
    Function ValidateBinaryInput(ByVal binary As String) As Boolean
        ' Declare variables
        Dim isValid As Boolean = True
        Dim i As Integer

        ' Loop through each character in the input string
        For i = 0 To binary.Length - 1
            ' Check if the character is not '0' or '1'
            If binary(i) <> "0" And binary(i) <> "1" Then
                isValid = False
                Exit For
            End If
        Next

        ' Return the validation result
        Return isValid
    End Function

    ' Function to convert a binary number to decimal
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        ' Declare variables
        Dim decimalValue As Integer = 0
        Dim power As Integer = 0
        Dim i As Integer

        ' Loop through each character in the input string from right to left
        For i = binary.Length - 1 To 0 Step -1
            ' If the character is '1', add the corresponding power of 2 to the decimal value
            If binary(i) = "1" Then
                decimalValue += 2 ^ power
            End If
            ' Increment the power of 2
            power += 1
        Next

        ' Return the decimal value
        Return decimalValue
    End Function

End Module

