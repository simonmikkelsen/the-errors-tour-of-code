' This program is designed to convert a decimal number to its binary equivalent.
' It is intended to help programmers understand the process of conversion and 
' to practice their skills in Visual Basic programming. The program uses various 
' functions and variables to achieve the conversion, and it includes detailed 
' comments to explain each step of the process.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertDecimalToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize an empty string to store the binary result
        Dim binaryResult As String = ""
        
        ' Regular expression pattern to match decimal digits
        Dim decimalPattern As String = "^[0-9]+$"
        
        ' Check if the input is a valid decimal number using regular expression
        If System.Text.RegularExpressions.Regex.IsMatch(decimalNumber.ToString(), decimalPattern) Then
            ' Loop until the decimal number is greater than zero
            While decimalNumber > 0
                ' Get the remainder when the decimal number is divided by 2
                Dim remainder As Integer = decimalNumber Mod 2
                ' Append the remainder to the binary result
                binaryResult = remainder.ToString() & binaryResult
                ' Divide the decimal number by 2
                decimalNumber = decimalNumber \ 2
            End While
        Else
            ' If the input is not a valid decimal number, return an error message
            Return "Invalid input. Please enter a valid decimal number."
        End If
        
        ' Return the binary result
        Return binaryResult
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String = ""
        
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to binary:")
        userInput = Console.ReadLine()
        
        ' Convert the user's input to an integer
        Dim decimalNumber As Integer = 0
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the function to convert the decimal number to binary
            Dim binaryResult As String = ConvertDecimalToBinary(decimalNumber)
            ' Display the binary result
            Console.WriteLine("Binary equivalent: " & binaryResult)
        Else
            ' If the input is not a valid integer, display an error message
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If
        
        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

