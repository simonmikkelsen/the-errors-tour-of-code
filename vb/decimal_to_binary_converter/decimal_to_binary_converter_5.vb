' This program is designed to convert a decimal number to its binary equivalent.
' It is a great tool for understanding the conversion process and practicing programming skills.
' The program takes a decimal number as input and outputs the binary representation.

Module DecimalToBinaryConverter

    ' This function converts a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize an empty string to store the binary result
        Dim binaryResult As String = ""
        
        ' Temporary variable to hold the decimal number during conversion
        Dim tempDecimal As Integer = decimalNumber
        
        ' Loop until the decimal number is greater than zero
        While tempDecimal > 0
            ' Get the remainder when the decimal number is divided by 2
            Dim remainder As Integer = tempDecimal Mod 2
            
            ' Append the remainder to the binary result
            binaryResult = remainder.ToString() & binaryResult
            
            ' Divide the decimal number by 2 and update the temporary variable
            tempDecimal = tempDecimal \ 2
        End While
        
        ' Return the binary result
        Return binaryResult
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare a variable to store the user input
        Dim userInput As String
        
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Please enter a decimal number to convert to binary:")
        
        ' Read the user input
        userInput = Console.ReadLine()
        
        ' Convert the user input to an integer
        Dim decimalNumber As Integer = Convert.ToInt32(userInput)
        
        ' Call the conversion function and store the result
        Dim binaryResult As String = ConvertToBinary(decimalNumber)
        
        ' Display the binary result to the user
        Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)
        
        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

