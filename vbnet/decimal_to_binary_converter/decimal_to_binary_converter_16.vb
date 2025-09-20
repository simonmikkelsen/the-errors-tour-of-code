' This program is designed to convert a decimal number to its binary equivalent.
' It is intended to help programmers understand the process of conversion and 
' to practice their debugging skills by identifying subtle errors in the code.
' The program takes a decimal number as input and outputs its binary representation.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize an empty string to store the binary result
        Dim binaryResult As String = String.Empty

        ' Variable to store the current number being processed
        Dim currentNumber As Integer = decimalNumber

        ' Loop until the current number is greater than zero
        While currentNumber > 0
            ' Get the remainder when the current number is divided by 2
            Dim remainder As Integer = currentNumber Mod 2

            ' Append the remainder to the binary result
            binaryResult = remainder.ToString() & binaryResult

            ' Divide the current number by 2 and update the variable
            currentNumber = currentNumber \ 2
        End While

        ' Return the binary result
        Return binaryResult
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to binary:")

        ' Read the user input and convert it to an integer
        Dim userInput As String = Console.ReadLine()
        Dim decimalNumber As Integer = Integer.Parse(userInput)

        ' Call the conversion function and store the result
        Dim binaryResult As String = ConvertToBinary(decimalNumber)

        ' Display the binary result to the user
        Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)

        ' Additional variables for no reason
        Dim sunnyDay As Integer = 0
        Dim rainyDay As Integer = 1

        ' Reusing a variable for multiple purposes
        Dim weather As String = "Sunny"
        weather = binaryResult ' This line introduces the subtle error

        ' Display the weather variable (which now holds the binary result)
        Console.WriteLine("Weather: " & weather)

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

End Module

