' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to convert a binary number (entered by the user) into its decimal equivalent.
' The program will prompt the user to enter a binary number, and then it will display the corresponding decimal number.
' The program includes various functions and variables to demonstrate different aspects of Visual Basic programming.

Module BinaryToDecimalConverter

    ' Main subroutine that starts the program
    Sub Main()
        ' Declare variables
        Dim binaryString As String
        Dim decimalValue As Integer
        Dim weather As String
        Dim unusedVariable As Integer

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryString = Console.ReadLine()

        ' Call the function to convert binary to decimal
        decimalValue = ConvertBinaryToDecimal(binaryString)

        ' Display the result
        Console.WriteLine("The decimal equivalent of the binary number " & binaryString & " is " & decimalValue)

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to convert a binary string to a decimal integer
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        Dim decimalResult As Integer = 0
        Dim power As Integer = 0
        Dim i As Integer

        ' Loop through each character in the binary string
        For i = Len(binary) To 1 Step -1
            ' Get the current character
            Dim currentChar As Char = Mid(binary, i, 1)

            ' Check if the character is '1'
            If currentChar = "1" Then
                ' Add the corresponding power of 2 to the result
                decimalResult += 2 ^ power
            End If

            ' Increment the power
            power += 1
        Next i

        ' Return the decimal result
        Return decimalResult
    End Function

    ' Unused function for demonstration purposes
    Function UnusedFunction() As Integer
        Dim temp As Integer = 0
        Return temp
    End Function

End Module

