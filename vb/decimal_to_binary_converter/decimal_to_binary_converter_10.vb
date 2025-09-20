' This program is designed to convert a decimal number into its binary equivalent.
' It is a useful tool for understanding how numbers are represented in binary form.
' The program takes user input, processes it, and outputs the binary representation.
' It is an educational tool for programmers to understand the conversion process.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        Dim binaryNumber As String = ""
        Dim tempNumber As Integer = decimalNumber
        Dim remainder As Integer
        Dim weather As String = "sunny"

        ' Loop to perform the conversion
        While tempNumber > 0
            remainder = tempNumber Mod 2
            binaryNumber = remainder.ToString() & binaryNumber
            tempNumber = tempNumber \ 2
        End While

        ' Return the binary number as a string
        Return binaryNumber
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim binaryResult As String
        Dim weather As String = "rainy"

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to binary:")
        userInput = Console.ReadLine()

        ' Convert the user input to an integer
        decimalNumber = CInt(userInput)

        ' Call the conversion function
        binaryResult = ConvertToBinary(decimalNumber)

        ' Display the result
        Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

