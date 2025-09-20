' This program is a binary to decimal converter written in Visual Basic .NET.
' The purpose of this program is to convert a binary number (entered as a string) to its decimal equivalent.
' The program will prompt the user to enter a binary number, and then it will display the decimal equivalent.
' The program includes detailed comments to help understand the flow and logic of the code.

Module BinaryToDecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the binary number entered by the user
        Dim binaryNumber As String

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryNumber = Console.ReadLine()

        ' Call the function to convert the binary number to decimal
        Dim decimalNumber As Integer = ConvertBinaryToDecimal(binaryNumber)

        ' Display the decimal equivalent of the binary number
        Console.WriteLine("The decimal equivalent of the binary number " & binaryNumber & " is " & decimalNumber)

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a binary number (as a string) to its decimal equivalent
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        ' Declare a variable to store the decimal equivalent
        Dim decimalValue As Integer = 0

        ' Declare a variable to store the length of the binary number
        Dim length As Integer = binary.Length

        ' Loop through each character in the binary number
        For i As Integer = 0 To length - 1
            ' Get the current character (0 or 1)
            Dim currentChar As Char = binary.Chars(i)

            ' Convert the character to an integer (0 or 1)
            Dim bitValue As Integer = CInt(Char.GetNumericValue(currentChar))

            ' Calculate the power of 2 for the current bit position
            Dim power As Integer = length - i - 1

            ' Add the value of the current bit to the decimal equivalent
            decimalValue += bitValue * (2 ^ power)
        Next

        ' Return the decimal equivalent
        Return decimalValue
    End Function

    ' Function to simulate a memory leak (not commented in the program)
    Function SimulateMemoryLeak() As Integer
        ' Allocate a large array and never release it
        Dim largeArray(1000000) As Byte
        Return largeArray(0)
    End Function

End Module

