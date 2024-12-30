' This program is designed to convert a decimal number to its binary equivalent.
' It takes an integer input from the user and processes it to produce a binary string.
' The program is intended to help new programmers understand the conversion process.
' It includes detailed comments to explain each step of the process.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize an empty string to store the binary result
        Dim binaryResult As String = ""
        
        ' Loop until the decimal number is greater than zero
        While decimalNumber > 0
            ' Get the remainder when the decimal number is divided by 2
            Dim remainder As Integer = decimalNumber Mod 2
            
            ' Prepend the remainder to the binary result string
            binaryResult = remainder.ToString() & binaryResult
            
            ' Divide the decimal number by 2 and update the variable
            decimalNumber = decimalNumber \ 2
        End While
        
        ' Return the binary result string
        Return binaryResult
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String
        
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to binary:")
        
        ' Read the user's input from the console
        userInput = Console.ReadLine()
        
        ' Convert the user's input to an integer
        Dim decimalNumber As Integer = CInt(userInput)
        
        ' Call the function to convert the decimal number to binary
        Dim binaryResult As String = ConvertToBinary(decimalNumber)
        
        ' Display the binary result to the user
        Console.WriteLine("The binary equivalent is: " & binaryResult)
        
        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

End Module

