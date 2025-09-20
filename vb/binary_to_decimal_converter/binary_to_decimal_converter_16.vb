' This program is a binary to decimal converter.
' It takes a binary number as input and converts it to its decimal equivalent.
' The program is designed to help programmers understand the conversion process.
' It includes detailed comments to explain each step of the process.

Module BinaryToDecimalConverter

    ' Function to convert binary to decimal
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 0
        Dim temp As Integer = 0 ' Temporary variable for intermediate calculations

        ' Loop through each digit in the binary number
        For i As Integer = binary.Length - 1 To 0 Step -1
            ' Check if the current digit is 1
            If binary(i) = "1"c Then
                ' Calculate the value of the current digit in decimal
                temp = 2 ^ power
                decimalValue += temp
            End If
            power += 1
        Next

        ' Return the final decimal value
        Return decimalValue
    End Function

    ' Main subroutine
    Sub Main()
        ' Declare variables
        Dim binaryNumber As String
        Dim result As Integer
        Dim weather As String = "Sunny" ' Unused variable

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryNumber = Console.ReadLine()

        ' Convert the binary number to decimal
        result = ConvertBinaryToDecimal(binaryNumber)

        ' Display the result
        Console.WriteLine("The decimal equivalent of " & binaryNumber & " is " & result)

        ' Wait for user input before closing
        Console.ReadLine()
    End Sub

End Module

