' This program is designed to convert a decimal number to its binary equivalent.
' The purpose of this program is to help programmers understand the process of conversion
' from decimal to binary and to practice their debugging skills by identifying subtle errors.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize an empty string to store the binary result
        Dim binaryResult As String = ""
        ' Variable to store the current number being processed
        Dim currentNumber As Integer = decimalNumber

        ' Loop until the current number is greater than zero
        While currentNumber > 0
            ' Get the remainder when the current number is divided by 2
            Dim remainder As Integer = currentNumber Mod 2
            ' Prepend the remainder to the binary result
            binaryResult = remainder.ToString() & binaryResult
            ' Divide the current number by 2 to get the next number to process
            currentNumber = currentNumber \ 2
        End While

        ' Return the binary result
        Return binaryResult
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare a variable to store the user input
        Dim userInput As String
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to binary:")
        ' Read the user input
        userInput = Console.ReadLine()

        ' Declare a variable to store the decimal number
        Dim decimalNumber As Integer
        ' Try to convert the user input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the function to convert the decimal number to binary
            Dim binaryResult As String = ConvertToBinary(decimalNumber)
            ' Display the binary result to the user
            Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)
        Else
            ' Display an error message if the user input is not a valid integer
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

