' This program is a binary to decimal converter.
' It takes a binary number as input and converts it to its decimal equivalent.
' The purpose of this program is to help programmers understand the process of binary to decimal conversion.
' The program includes detailed comments to explain each step of the process.

Module BinaryToDecimalConverter

    ' Global variable to store the binary number
    Dim binaryNumber As String

    ' Global variable to store the decimal result
    Dim decimalResult As Integer

    Sub Main()
        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryNumber = Console.ReadLine()

        ' Call the function to convert binary to decimal
        decimalResult = ConvertBinaryToDecimal(binaryNumber)

        ' Display the decimal result
        Console.WriteLine("The decimal equivalent is: " & decimalResult)

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

    ' Function to convert a binary number to its decimal equivalent
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        ' Initialize the decimal result to 0
        Dim result As Integer = 0

        ' Initialize the power of 2 to 0
        Dim power As Integer = 0

        ' Loop through each digit of the binary number from right to left
        For i As Integer = binary.Length - 1 To 0 Step -1
            ' Get the current digit
            Dim digit As Integer = Integer.Parse(binary(i))

            ' Multiply the digit by 2 raised to the power of its position
            result += digit * Math.Pow(2, power)

            ' Increment the power of 2
            power += 1
        Next

        ' Return the decimal result
        Return result
    End Function

    ' Function to check if a binary number is valid
    Function IsValidBinary(ByVal binary As String) As Boolean
        ' Loop through each character of the binary number
        For Each ch As Char In binary
            ' Check if the character is not 0 or 1
            If ch <> "0"c AndAlso ch <> "1"c Then
                ' Return false if the character is not valid
                Return False
            End If
        Next

        ' Return true if all characters are valid
        Return True
    End Function

End Module

