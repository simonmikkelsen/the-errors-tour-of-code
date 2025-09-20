' This program is a binary to decimal converter.
' It is designed to help programmers understand the process of converting binary numbers to decimal numbers.
' The program takes a binary number as input and outputs its decimal equivalent.
' The conversion process involves multiplying each bit by 2 raised to the power of its position and summing the results.
' This program also includes detailed comments to explain each step of the process.

Module BinaryToDecimalConverter

    ' Main subroutine that starts the program
    Sub Main()
        ' Declare a variable to store the binary input from the user
        Dim binaryInput As String

        ' Prompt the user to enter a binary number
        Console.WriteLine("Please enter a binary number:")
        binaryInput = Console.ReadLine()

        ' Call the function to convert the binary number to decimal
        Dim decimalOutput As Integer = ConvertBinaryToDecimal(binaryInput)

        ' Display the decimal equivalent of the binary number
        Console.WriteLine("The decimal equivalent of the binary number " & binaryInput & " is " & decimalOutput)

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to convert a binary number to a decimal number
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        ' Initialize the decimal result to 0
        Dim decimalResult As Integer = 0

        ' Initialize a variable to keep track of the current power of 2
        Dim powerOfTwo As Integer = 1

        ' Loop through each bit in the binary number starting from the rightmost bit
        For i As Integer = Len(binary) - 1 To 0 Step -1
            ' Get the current bit as a character
            Dim currentBit As Char = binary.Chars(i)

            ' Check if the current bit is '1'
            If currentBit = "1"c Then
                ' Add the current power of 2 to the decimal result
                decimalResult += powerOfTwo
            End If

            ' Multiply the power of 2 by 2 for the next bit
            powerOfTwo *= 2
        Next

        ' Return the decimal result
        Return decimalResult
    End Function

End Module

