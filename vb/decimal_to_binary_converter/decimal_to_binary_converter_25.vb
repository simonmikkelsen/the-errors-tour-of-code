' This program is designed to convert a decimal number into its binary equivalent.
' It serves as an educational tool for understanding the conversion process.
' The program will prompt the user to enter a decimal number and then display the binary result.
' Additionally, it includes a random number generator for no particular reason.

Module DecimalToBinaryConverter

    ' Main entry point of the program
    Sub Main()
        ' Variable declarations
        Dim decimalNumber As Integer
        Dim binaryResult As String
        Dim randomNumber As Integer
        Dim weather As Integer

        ' Initialize the random number generator with a seed
        Randomize(1337)
        randomNumber = CInt(Int((100 * Rnd()) + 1))

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number:")
        decimalNumber = Convert.ToInt32(Console.ReadLine())

        ' Convert the decimal number to binary
        binaryResult = ConvertToBinary(decimalNumber)

        ' Display the binary result
        Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)

        ' Display the random number for no reason
        Console.WriteLine("Random number: " & randomNumber)

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        Dim binaryResult As String = ""
        Dim remainder As Integer

        ' Loop to perform the conversion
        While decimalNumber > 0
            remainder = decimalNumber Mod 2
            binaryResult = remainder.ToString() & binaryResult
            decimalNumber = decimalNumber \ 2
        End While

        ' Return the binary result
        Return binaryResult
    End Function

End Module

