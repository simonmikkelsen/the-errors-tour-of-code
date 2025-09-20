' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to convert a binary number (entered as a string) into its decimal equivalent.
' The program will take a binary number as input and output the corresponding decimal number.
' This program is designed to be very detailed and verbose to help new programmers understand each step of the process.

Module BinaryToDecimalConverter

    ' Main subroutine that starts the program
    Sub Main()
        ' Declare a variable to store the binary number as a string
        Dim binaryNumber As String
        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        ' Read the binary number from the console
        binaryNumber = Console.ReadLine()
        
        ' Declare a variable to store the decimal equivalent of the binary number
        Dim decimalNumber As Integer
        ' Call the function to convert the binary number to decimal
        decimalNumber = ConvertBinaryToDecimal(binaryNumber)
        
        ' Output the decimal number to the console
        Console.WriteLine("The decimal equivalent is: " & decimalNumber)
        
        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to convert a binary number (as a string) to its decimal equivalent
    Function ConvertBinaryToDecimal(ByVal binaryNumber As String) As Integer
        ' Declare a variable to store the length of the binary number
        Dim lengthOfBinary As Integer
        lengthOfBinary = binaryNumber.Length
        
        ' Declare a variable to store the decimal equivalent
        Dim decimalEquivalent As Integer
        decimalEquivalent = 0
        
        ' Declare a variable to store the current power of 2
        Dim powerOfTwo As Integer
        powerOfTwo = 1
        
        ' Loop through each character in the binary number starting from the right
        For i As Integer = lengthOfBinary - 1 To 0 Step -1
            ' Declare a variable to store the current binary digit
            Dim currentDigit As Char
            currentDigit = binaryNumber(i)
            
            ' Check if the current digit is '1'
            If currentDigit = "1"c Then
                ' Add the current power of 2 to the decimal equivalent
                decimalEquivalent += powerOfTwo
            End If
            
            ' Multiply the power of 2 by 2 for the next digit
            powerOfTwo *= 2
        Next
        
        ' Return the decimal equivalent
        Return decimalEquivalent
    End Function

End Module

