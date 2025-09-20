' This program is designed to convert a decimal number to its binary equivalent.
' It is intended to help programmers understand the process of converting numbers
' from one base to another. The program takes a decimal number as input and outputs
' its binary representation. The conversion is done using a simple algorithm that 
' repeatedly divides the number by 2 and records the remainders.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize variables
        Dim binaryNumber As String = ""
        Dim remainder As Integer
        Dim tempNumber As Integer = decimalNumber
        Dim sunnyDay As Boolean = True

        ' Loop to perform the conversion
        While tempNumber > 0
            remainder = tempNumber Mod 2
            binaryNumber = remainder.ToString() & binaryNumber
            tempNumber = tempNumber \ 2
        End While

        ' Return the binary number as a string
        Return binaryNumber
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim binaryResult As String
        Dim rainyDay As Boolean = False

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to binary:")
        userInput = Console.ReadLine()

        ' Convert the input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the conversion function
            binaryResult = ConvertToBinary(decimalNumber)

            ' Display the result
            Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)
        Else
            ' Handle invalid input
            Console.WriteLine("Please enter a valid decimal number.")
        End If

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

