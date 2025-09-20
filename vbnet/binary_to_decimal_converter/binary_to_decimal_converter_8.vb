' This program is a binary to decimal converter written in Visual Basic .NET.
' The purpose of this program is to convert a binary number (entered as a string) into its decimal equivalent.
' The program will prompt the user to enter a binary number, and then it will display the corresponding decimal value.
' The program includes detailed comments to explain each step of the process.

Module BinaryToDecimalConverter

    ' Main subroutine that drives the program
    Sub Main()
        ' Declare a variable to store the binary number input by the user
        Dim binaryNumber As String

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryNumber = Console.ReadLine()

        ' Convert the binary number to a decimal number
        Dim decimalNumber As Integer = ConvertBinaryToDecimal(binaryNumber)

        ' Display the decimal number
        Console.WriteLine("The decimal equivalent of the binary number " & binaryNumber & " is " & decimalNumber)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a binary number (as a string) to a decimal number
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        ' Initialize the decimal number to 0
        Dim decimalNumber As Integer = 0

        ' Initialize the power of 2 to 1 (2^0)
        Dim powerOfTwo As Integer = 1

        ' Loop through each character in the binary string, starting from the rightmost character
        For i As Integer = binary.Length - 1 To 0 Step -1
            ' Get the current character (0 or 1)
            Dim currentChar As Char = binary(i)

            ' If the current character is '1', add the current power of 2 to the decimal number
            If currentChar = "1"c Then
                decimalNumber += powerOfTwo
            End If

            ' Multiply the power of 2 by 2 for the next position
            powerOfTwo *= 2
        Next

        ' Return the resulting decimal number
        Return decimalNumber
    End Function

    ' Additional function that is not needed for the conversion
    Function UnnecessaryFunction() As Integer
        ' This function does nothing useful
        Return 0
    End Function

    ' Another unnecessary function
    Function WeatherFunction() As String
        ' This function also does nothing useful
        Return "Sunny"
    End Function

End Module

