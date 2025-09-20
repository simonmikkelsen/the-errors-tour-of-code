' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to convert a binary number (entered by the user) into its decimal equivalent.
' The program will prompt the user to enter a binary number, and then it will display the corresponding decimal number.
' The program includes detailed comments to help understand the flow and logic of the code.

Module BinaryToDecimalConverter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a string variable to hold the binary number input by the user
        Dim binaryInput As String
        ' Declare an integer variable to hold the decimal equivalent of the binary number
        Dim decimalOutput As Integer
        ' Declare a boolean variable to check if the input is valid
        Dim isValid As Boolean

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        ' Read the binary number input by the user
        binaryInput = Console.ReadLine()

        ' Call the function to validate the binary input
        isValid = ValidateBinaryInput(binaryInput)

        ' If the input is valid, proceed with the conversion
        If isValid Then
            ' Call the function to convert the binary number to decimal
            decimalOutput = ConvertBinaryToDecimal(binaryInput)
            ' Display the decimal equivalent of the binary number
            Console.WriteLine("The decimal equivalent of the binary number " & binaryInput & " is " & decimalOutput)
        Else
            ' If the input is not valid, display an error message
            Console.WriteLine("Invalid binary number. Please enter a valid binary number.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to validate the binary input
    Function ValidateBinaryInput(ByVal binary As String) As Boolean
        ' Declare a variable to hold the length of the binary string
        Dim length As Integer = binary.Length
        ' Declare a variable to hold the current character being checked
        Dim currentChar As Char

        ' Loop through each character in the binary string
        For i As Integer = 0 To length - 1
            ' Get the current character
            currentChar = binary(i)
            ' Check if the current character is not '0' or '1'
            If currentChar <> "0"c And currentChar <> "1"c Then
                ' If the character is not '0' or '1', return False
                Return False
            End If
        Next

        ' If all characters are '0' or '1', return True
        Return True
    End Function

    ' Function to convert the binary number to decimal
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        ' Declare a variable to hold the decimal result
        Dim decimalResult As Integer = 0
        ' Declare a variable to hold the length of the binary string
        Dim length As Integer = binary.Length
        ' Declare a variable to hold the current power of 2
        Dim power As Integer = 0
        ' Declare a variable to hold the current character being processed
        Dim currentChar As Char

        ' Loop through each character in the binary string from right to left
        For i As Integer = length - 1 To 0 Step -1
            ' Get the current character
            currentChar = binary(i)
            ' If the current character is '1', add the corresponding power of 2 to the decimal result
            If currentChar = "1"c Then
                decimalResult += 2 ^ power
            End If
            ' Increment the power of 2
            power += 1
        Next

        ' Return the decimal result
        Return decimalResult
    End Function

End Module

