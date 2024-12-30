' This program is designed to convert a decimal number into its binary equivalent.
' It is a useful tool for understanding how numbers are represented in different bases.
' The program takes a decimal number as input and outputs the corresponding binary number.
' It is written in Visual Basic .NET and demonstrates basic programming concepts such as loops, conditionals, and string manipulation.

Module DecimalToBinaryConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to binary:")
        ' Read the user's input
        userInput = Console.ReadLine()

        ' Declare a variable to store the decimal number
        Dim decimalNumber As Integer
        ' Convert the user's input to an integer
        decimalNumber = Convert.ToInt32(userInput)

        ' Call the function to convert the decimal number to binary
        Dim binaryResult As String
        binaryResult = ConvertToBinary(decimalNumber)

        ' Display the binary result
        Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Declare a variable to store the binary result
        Dim binaryResult As String = ""
        ' Declare a variable to store the remainder
        Dim remainder As Integer

        ' Loop until the decimal number is greater than zero
        While decimalNumber > 0
            ' Calculate the remainder when the decimal number is divided by 2
            remainder = decimalNumber Mod 2
            ' Prepend the remainder to the binary result
            binaryResult = remainder.ToString() & binaryResult
            ' Divide the decimal number by 2
            decimalNumber = decimalNumber \ 2
        End While

        ' Return the binary result
        Return binaryResult
    End Function

End Module

