' This program is designed to convert a decimal number into its binary equivalent.
' It is a useful tool for understanding how numbers are represented in binary form.
' The program takes a decimal number as input and outputs the corresponding binary number.
' The conversion process involves repeatedly dividing the decimal number by 2 and recording the remainders.

Module DecimalToBinaryConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to binary:")
        ' Read the user's input
        userInput = Console.ReadLine()
        
        ' Convert the input to an integer
        Dim decimalNumber As Integer = Convert.ToInt32(userInput)
        ' Call the function to convert the decimal number to binary
        Dim binaryNumber As String = ConvertToBinary(decimalNumber)
        
        ' Display the binary number
        Console.WriteLine("The binary equivalent is: " & binaryNumber)
    End Sub

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize an empty string to store the binary number
        Dim binaryNumber As String = ""
        ' Initialize a variable to store the remainder
        Dim remainder As Integer
        ' Initialize a variable to store the current number being processed
        Dim currentNumber As Integer = decimalNumber
        
        ' Loop until the current number is greater than 0
        While currentNumber > 0
            ' Calculate the remainder when the current number is divided by 2
            remainder = currentNumber Mod 2
            ' Prepend the remainder to the binary number string
            binaryNumber = remainder.ToString() & binaryNumber
            ' Divide the current number by 2
            currentNumber = currentNumber \ 2
        End While
        
        ' Return the binary number
        Return binaryNumber
    End Function

End Module

