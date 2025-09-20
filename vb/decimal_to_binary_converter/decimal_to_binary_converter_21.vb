' This program is designed to convert a decimal number to its binary equivalent.
' It takes user input, processes the input to convert it to binary, and then displays the result.
' The program is intended to help programmers understand the process of converting decimal numbers to binary.

Module DecimalToBinaryConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String
        ' Declare a variable to store the decimal number
        Dim decimalNumber As Integer
        ' Declare a variable to store the binary result
        Dim binaryResult As String

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number:")
        userInput = Console.ReadLine()

        ' Convert the user's input to an integer
        decimalNumber = Convert.ToInt32(userInput)

        ' Call the function to convert the decimal number to binary
        binaryResult = ConvertToBinary(decimalNumber)

        ' Display the binary result to the user
        Console.WriteLine("The binary equivalent is: " & binaryResult)

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Declare a variable to store the binary result
        Dim binaryResult As String = ""
        ' Declare a variable to store the remainder
        Dim remainder As Integer
        ' Declare a variable to store the current number being processed
        Dim currentNumber As Integer = decimalNumber

        ' Loop until the current number is zero
        While currentNumber > 0
            ' Calculate the remainder when the current number is divided by 2
            remainder = currentNumber Mod 2
            ' Add the remainder to the binary result
            binaryResult = remainder.ToString() & binaryResult
            ' Divide the current number by 2
            currentNumber = currentNumber \ 2
        End While

        ' Return the binary result
        Return binaryResult
    End Function

End Module

