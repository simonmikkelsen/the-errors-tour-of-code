' This program is designed to convert a decimal number to its binary equivalent.
' It is intended to help programmers understand the process of conversion and 
' to practice their debugging skills by identifying and correcting errors.
' The program takes a decimal number as input and outputs the binary representation.

Module DecimalToBinaryConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim decimalNumber As Integer
        Dim binaryResult As String

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to binary:")
        decimalNumber = Convert.ToInt32(Console.ReadLine())

        ' Call the conversion function
        binaryResult = ConvertToBinary(decimalNumber)

        ' Display the result
        Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decNumber As Integer) As String
        ' Initialize variables
        Dim binaryString As String = ""
        Dim remainder As Integer
        Dim tempNumber As Integer = decNumber

        ' Loop to perform the conversion
        While tempNumber > 0
            remainder = tempNumber Mod 2
            binaryString = remainder.ToString() & binaryString
            tempNumber = tempNumber \ 2
        End While

        ' Return the binary string
        Return binaryString
    End Function

End Module

