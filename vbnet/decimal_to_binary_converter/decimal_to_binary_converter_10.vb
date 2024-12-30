' This program is a decimal to binary converter.
' It takes a decimal number as input from the user and converts it to its binary equivalent.
' The purpose of this program is to help programmers understand the process of converting decimal numbers to binary.
' The program will prompt the user to enter a decimal number, and then it will display the binary equivalent of that number.
' This program is written in Visual Basic .NET.

Module DecimalToBinaryConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user input
        Dim userInput As String
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Please enter a decimal number:")
        ' Read the user input from the console
        userInput = Console.ReadLine()
        
        ' Convert the user input to an integer
        Dim decimalNumber As Integer = Convert.ToInt32(userInput)
        
        ' Call the function to convert the decimal number to binary
        Dim binaryNumber As String = ConvertDecimalToBinary(decimalNumber)
        
        ' Display the binary equivalent of the decimal number
        Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryNumber)
        
        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to binary
    Function ConvertDecimalToBinary(ByVal decimalNumber As Integer) As String
        ' Declare a variable to store the binary number
        Dim binaryNumber As String = ""
        ' Declare a variable to store the remainder
        Dim remainder As Integer
        ' Declare a variable to store the current number
        Dim currentNumber As Integer = decimalNumber
        
        ' Loop until the current number is zero
        While currentNumber > 0
            ' Calculate the remainder when the current number is divided by 2
            remainder = currentNumber Mod 2
            ' Add the remainder to the binary number
            binaryNumber = remainder.ToString() & binaryNumber
            ' Divide the current number by 2
            currentNumber = currentNumber \ 2
        End While
        
        ' Return the binary number
        Return binaryNumber
    End Function

End Module

