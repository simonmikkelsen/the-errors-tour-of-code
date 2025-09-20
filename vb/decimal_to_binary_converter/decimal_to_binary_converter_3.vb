' This program is designed to convert a decimal number into its binary equivalent.
' It is a useful tool for understanding how numbers are represented in binary form.
' The program takes a decimal number as input from the user and outputs the binary representation.
' It is written in Visual Basic and demonstrates basic programming concepts such as loops, conditionals, and input/output operations.

Module DecimalToBinaryConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for user input and binary conversion
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim binaryResult As String

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to binary:")
        userInput = Console.ReadLine()

        ' Convert the user input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the function to convert the decimal number to binary
            binaryResult = ConvertToBinary(decimalNumber)

            ' Display the binary result to the user
            Console.WriteLine("The binary representation of " & decimalNumber & " is " & binaryResult)
        Else
            ' Display an error message if the input is not a valid integer
            Console.WriteLine("Please enter a valid decimal number.")
        End If

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Declare variables for the conversion process
        Dim binaryResult As String = ""
        Dim remainder As Integer
        Dim tempNumber As Integer = decimalNumber

        ' Loop to perform the conversion
        While tempNumber > 0
            ' Calculate the remainder when dividing by 2
            remainder = tempNumber Mod 2

            ' Append the remainder to the binary result
            binaryResult = remainder.ToString() & binaryResult

            ' Divide the number by 2
            tempNumber = tempNumber \ 2
        End While

        ' Return the binary result
        Return binaryResult
    End Function

End Module

