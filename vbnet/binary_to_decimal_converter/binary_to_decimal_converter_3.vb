' This program is a binary to decimal converter written in Visual Basic .NET.
' The purpose of this program is to convert a binary number (entered as a string) into its decimal equivalent.
' The program will prompt the user to enter a binary number, and then it will display the corresponding decimal number.
' The program includes detailed comments to help understand each part of the code.

Imports System.IO

Module BinaryToDecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the binary number input by the user
        Dim binaryNumber As String

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryNumber = Console.ReadLine()

        ' Call the function to convert the binary number to decimal
        Dim decimalNumber As Integer = ConvertBinaryToDecimal(binaryNumber)

        ' Display the decimal equivalent of the binary number
        Console.WriteLine("The decimal equivalent of the binary number " & binaryNumber & " is " & decimalNumber)

        ' Wait for the user to press a key before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a binary number (as a string) to its decimal equivalent
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        ' Declare a variable to store the decimal result
        Dim decimalResult As Integer = 0

        ' Declare a variable to store the length of the binary string
        Dim length As Integer = binary.Length

        ' Loop through each character in the binary string
        For i As Integer = 0 To length - 1
            ' Get the current character (0 or 1)
            Dim currentChar As Char = binary.Chars(i)

            ' Convert the character to an integer (0 or 1)
            Dim currentBit As Integer = Convert.ToInt32(currentChar.ToString())

            ' Calculate the power of 2 for the current bit position
            Dim power As Integer = length - i - 1

            ' Add the value of the current bit to the decimal result
            decimalResult += currentBit * Math.Pow(2, power)
        Next

        ' Return the decimal result
        Return decimalResult
    End Function

    ' Function to write the binary number to a file (not needed for conversion)
    Sub WriteBinaryToFile(ByVal binary As String)
        ' Declare a variable to store the file path
        Dim filePath As String = "binary.txt"

        ' Create a StreamWriter to write to the file
        Dim writer As StreamWriter = New StreamWriter(filePath)

        ' Write the binary number to the file
        writer.WriteLine(binary)

        ' Close the StreamWriter (resource leak here)
        ' writer.Close()
    End Sub

End Module

