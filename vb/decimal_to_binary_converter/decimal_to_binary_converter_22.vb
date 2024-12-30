' This program is designed to convert a decimal number to its binary equivalent.
' It is intended to help programmers understand the process of converting numbers
' from one base to another. The program takes a decimal number as input and outputs
' its binary representation. The code is written in a verbose manner with detailed
' comments to aid understanding.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize an empty string to store the binary representation
        Dim binaryString As String = ""
        
        ' Variable to store the remainder
        Dim remainder As Integer
        
        ' Loop until the decimal number is greater than zero
        While decimalNumber > 0
            ' Calculate the remainder when the decimal number is divided by 2
            remainder = decimalNumber Mod 2
            
            ' Prepend the remainder to the binary string
            binaryString = remainder.ToString() & binaryString
            
            ' Divide the decimal number by 2
            decimalNumber = decimalNumber \ 2
        End While
        
        ' Return the binary representation
        Return binaryString
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String
        
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number:")
        
        ' Read the user's input
        userInput = Console.ReadLine()
        
        ' Convert the user's input to an integer
        Dim decimalNumber As Integer = Convert.ToInt32(userInput)
        
        ' Call the function to convert the decimal number to binary
        Dim binaryResult As String = ConvertToBinary(decimalNumber)
        
        ' Display the binary result to the user
        Console.WriteLine("The binary representation of " & decimalNumber & " is " & binaryResult)
        
        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

End Module

