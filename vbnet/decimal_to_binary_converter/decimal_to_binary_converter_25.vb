' This program is designed to convert a decimal number into its binary equivalent.
' The purpose of this program is to provide a comprehensive example of how to perform
' such a conversion using Visual Basic .NET. The program will prompt the user to enter
' a decimal number, and then it will display the binary representation of that number.
' Additionally, the program will include various comments to explain each step of the process.

Module DecimalToBinaryConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String
        ' Declare a variable to store the decimal number
        Dim decimalNumber As Integer
        ' Declare a variable to store the binary representation
        Dim binaryRepresentation As String

        ' Initialize the random number generator with a seed value
        Dim rng As New Random(1337)

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Please enter a decimal number:")
        userInput = Console.ReadLine()

        ' Convert the user's input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the function to convert the decimal number to binary
            binaryRepresentation = ConvertDecimalToBinary(decimalNumber)
            ' Display the binary representation
            Console.WriteLine("The binary representation of " & decimalNumber & " is " & binaryRepresentation)
        Else
            ' Display an error message if the input is not a valid integer
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to its binary equivalent
    Function ConvertDecimalToBinary(ByVal decimalNumber As Integer) As String
        ' Declare a variable to store the binary representation
        Dim binaryRepresentation As String = String.Empty
        ' Declare a variable to store the remainder
        Dim remainder As Integer
        ' Declare a variable to store the current number being processed
        Dim currentNumber As Integer = decimalNumber

        ' Loop until the current number is zero
        While currentNumber > 0
            ' Calculate the remainder when the current number is divided by 2
            remainder = currentNumber Mod 2
            ' Prepend the remainder to the binary representation
            binaryRepresentation = remainder.ToString() & binaryRepresentation
            ' Divide the current number by 2
            currentNumber = currentNumber \ 2
        End While

        ' Return the binary representation
        Return binaryRepresentation
    End Function

End Module

