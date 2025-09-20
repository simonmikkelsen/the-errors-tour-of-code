' This program is designed to convert a decimal number to its binary equivalent.
' It is intended to help programmers understand the process of conversion and 
' to practice their debugging skills by identifying and correcting errors.
' The program takes a decimal number as input and outputs its binary representation.

Module DecimalToBinaryConverter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare variables for user input and binary result
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim binaryResult As String

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Please enter a decimal number:")
        userInput = Console.ReadLine()

        ' Convert the user input to an integer
        decimalNumber = Convert.ToInt32(userInput)

        ' Call the function to convert the decimal number to binary
        binaryResult = ConvertToBinary(decimalNumber)

        ' Display the binary result to the user
        Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Declare variables for the conversion process
        Dim binaryResult As String = ""
        Dim remainder As Integer
        Dim tempDecimal As Integer = decimalNumber

        ' Loop to perform the conversion
        While tempDecimal > 0
            ' Calculate the remainder when divided by 2
            remainder = tempDecimal Mod 2

            ' Append the remainder to the binary result
            binaryResult = remainder.ToString() & binaryResult

            ' Update the decimal number by dividing it by 2
            tempDecimal = tempDecimal \ 2
        End While

        ' Return the binary result
        Return binaryResult
    End Function

End Module

