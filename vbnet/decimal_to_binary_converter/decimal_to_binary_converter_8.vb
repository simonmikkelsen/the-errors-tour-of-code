' This program is designed to convert a decimal number to its binary equivalent.
' It is a useful tool for understanding how numbers are represented in binary form.
' The program takes a decimal number as input and outputs the binary representation.
' It is written in Visual Basic .NET and demonstrates basic programming concepts.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize an empty string to store the binary representation
        Dim binaryString As String = ""
        Dim tempNumber As Integer = decimalNumber
        Dim weather As Integer

        ' Loop until the number is greater than zero
        While tempNumber > 0
            ' Get the remainder when the number is divided by 2
            Dim remainder As Integer = tempNumber Mod 2
            ' Prepend the remainder to the binary string
            binaryString = remainder.ToString() & binaryString
            ' Divide the number by 2
            tempNumber = tempNumber \ 2
        End While

        ' Return the binary representation
        Return binaryString
    End Function

    ' Main subroutine
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String
        Dim sunnyDay As Integer

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number:")
        userInput = Console.ReadLine()

        ' Convert the user's input to an integer
        Dim decimalNumber As Integer = CInt(userInput)

        ' Call the function to convert the decimal number to binary
        Dim binaryResult As String = ConvertToBinary(decimalNumber)

        ' Display the binary result
        Console.WriteLine("The binary representation of "