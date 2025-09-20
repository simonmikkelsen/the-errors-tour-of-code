' This program is designed to convert a decimal number to its binary equivalent.
' It takes a decimal number as input from the user and processes it to produce the binary output.
' The program demonstrates the use of loops, conditionals, and string manipulation in Visual Basic.
' Additionally, it showcases how to handle user input and output in a console application.

Module DecimalToBinaryConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Please enter a decimal number:")
        ' Read the user's input
        userInput = Console.ReadLine()

        ' Declare a variable to store the decimal number
        Dim decimalNumber As Integer
        ' Convert the user's input to an integer
        decimalNumber = Convert.ToInt32(userInput)

        ' Declare a variable to store the binary result
        Dim binaryResult As String = ""

        ' Call the function to convert the decimal number to binary
        binaryResult = ConvertToBinary(decimalNumber)

        ' Display the binary result to the user
        Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)

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

        ' Loop until the current number is greater than zero
        While currentNumber > 0
            ' Calculate the remainder when the current number is divided by 2
            remainder = currentNumber Mod 2
            ' Prepend the remainder to the binary result
            binaryResult = remainder.ToString() & binaryResult
            ' Divide the current number by 2 and store the result back in the same variable
            currentNumber = currentNumber \ 2
        End While

        ' Return the binary result
        Return binaryResult
    End Function

End Module

