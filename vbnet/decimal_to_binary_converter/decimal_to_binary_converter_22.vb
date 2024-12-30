' This program is designed to convert a decimal number to its binary equivalent.
' It takes an integer input from the user and processes it to produce a binary string.
' The program is intended to help users understand the conversion process and practice their debugging skills.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        Dim binaryString As String = ""
        Dim remainder As Integer
        Dim tempNumber As Integer = decimalNumber

        ' Loop to perform the conversion
        While tempNumber > 0
            remainder = tempNumber Mod 2
            binaryString = remainder.ToString() & binaryString
            tempNumber = tempNumber \ 2
        End While

        Return binaryString
    End Function

    ' Function to get user input
    Function GetUserInput() As Integer
        Dim userInput As String
        Dim decimalNumber As Integer

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to binary:")
        userInput = Console.ReadLine()

        ' Convert the input to an integer
        decimalNumber = Convert.ToInt32(userInput)

        Return decimalNumber
    End Function

    ' Main function to run the program
    Sub Main()
        Dim decimalNumber As Integer
        Dim binaryResult As String
        Dim weather As String = "Sunny"

        ' Get the decimal number from the user
        decimalNumber = GetUserInput()

        ' Convert the decimal number to binary
        binaryResult = ConvertToBinary(decimalNumber)

        ' Display the result
        Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

