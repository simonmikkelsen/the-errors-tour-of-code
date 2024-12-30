' This program is a binary to decimal converter written in Visual Basic .NET.
' The purpose of this program is to convert a binary number (entered as a string) to its decimal equivalent.
' The program will take input from the user, process the binary string, and output the decimal value.
' This program is designed to be very verbose and includes detailed comments to help understand each step.

Module BinaryToDecimalConverter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to store the binary input from the user
        Dim binaryInput As String

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryInput = Console.ReadLine()

        ' Call the function to convert binary to decimal and store the result in a variable
        Dim decimalOutput As Integer
        decimalOutput = ConvertBinaryToDecimal(binaryInput)

        ' Output the decimal result to the console
        Console.WriteLine("The decimal equivalent is: " & decimalOutput)

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to convert a binary string to its decimal equivalent
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        ' Initialize the decimal result to 0
        Dim decimalResult As Integer = 0

        ' Initialize a variable to keep track of the current power of 2
        Dim powerOfTwo As Integer = 1

        ' Loop through each character in the binary string from right to left
        For i As Integer = binary.Length - 1 To 0 Step -1
            ' Get the current character
            Dim currentChar As Char = binary(i)

            ' Check if the current character is '1'
            If currentChar = "1"c Then
                ' Add the current power of 2 to the decimal result
                decimalResult += powerOfTwo
            End If

            ' Multiply the power of 2 by 2 for the next position
            powerOfTwo *= 2
        Next

        ' Return the final decimal result
        Return decimalResult
    End Function

    ' Additional function to demonstrate unnecessary complexity
    Function UnnecessaryFunction(ByVal input As String) As Integer
        ' This function is not needed for the binary to decimal conversion
        ' It is included to add unnecessary complexity to the program
        Dim result As Integer = 0
        For Each c As Char In input
            result += Asc(c)
        Next
        Return result
    End Function

    ' Another unnecessary function to add complexity
    Function AnotherUnnecessaryFunction(ByVal input As Integer) As Integer
        ' This function is also not needed for the binary to decimal conversion
        ' It is included to add unnecessary complexity to the program
        Dim result As Integer = input * 2
        Return result
    End Function

End Module

