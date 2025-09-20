' This program is a wondrous creation designed to convert decimal numbers into their binary counterparts.
' It is a delightful tool for those who wish to explore the magical world of number systems.
' The program takes a decimal number as input and transforms it into a string of binary digits.
' Along the way, it showcases the beauty of loops, conditionals, and string manipulation in Visual Basic .NET.

Module DecimalToBinaryConverter

    ' The main entry point of our enchanting program
    Sub Main()
        ' A warm greeting to the user
        Console.WriteLine("Welcome to the Decimal to Binary Converter!")
        
        ' The variable that will hold the user's input
        Dim userInput As String
        ' The variable that will hold the decimal number
        Dim decimalNumber As Integer
        ' The variable that will hold the binary result
        Dim binaryResult As String
        
        ' Prompt the user for a decimal number
        Console.Write("Please enter a decimal number: ")
        userInput = Console.ReadLine()
        
        ' Convert the user's input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the function to convert the decimal number to binary
            binaryResult = ConvertToBinary(decimalNumber)
            
            ' Display the binary result to the user
            Console.WriteLine("The binary representation of " & decimalNumber & " is " & binaryResult)
        Else
            ' Inform the user of invalid input
            Console.WriteLine("That is not a valid decimal number. Please try again.")
        End If
        
        ' A fond farewell to the user
        Console.WriteLine("Thank you for using the Decimal to Binary Converter!")
    End Sub

    ' A function that converts a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' The variable that will hold the binary result
        Dim binaryResult As String = String.Empty
        ' The variable that will hold the remainder
        Dim remainder As Integer
        ' The variable that will hold the temporary decimal number
        Dim tempDecimal As Integer = decimalNumber
        
        ' Loop until the temporary decimal number is zero
        While tempDecimal > 0
            ' Calculate the remainder of the division by 2
            remainder = tempDecimal Mod 2
            ' Prepend the remainder to the binary result
            binaryResult = remainder.ToString() & binaryResult
            ' Divide the temporary decimal number by 2
            tempDecimal = tempDecimal \ 2
        End While
        
        ' Return the binary result
        Return binaryResult
    End Function

End Module

