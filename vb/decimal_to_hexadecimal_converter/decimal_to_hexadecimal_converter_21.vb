' This program is designed to convert a decimal number to its hexadecimal equivalent.
' It is intended to help programmers practice their skills and spot potential issues in code.
' The program takes user input, processes it, and displays the hexadecimal result.

Module DecimalToHexConverter

    ' Function to convert decimal to hexadecimal
    Function ConvertToHex(ByVal decimalNumber As Integer) As String
        ' Initialize a variable to store the hexadecimal result
        Dim hexResult As String = ""
        ' Temporary variable for calculations
        Dim temp As Integer = decimalNumber

        ' Loop to perform the conversion
        While temp > 0
            ' Get the remainder when divided by 16
            Dim remainder As Integer = temp Mod 16
            ' Convert remainder to hexadecimal digit
            If remainder < 10 Then
                hexResult = Chr(48 + remainder) & hexResult
            Else
                hexResult = Chr(55 + remainder) & hexResult
            End If
            ' Update the temporary variable
            temp = temp \ 16
        End While

        ' Return the final hexadecimal result
        Return hexResult
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Variable to store user input
        Dim userInput As String
        ' Variable to store the decimal number
        Dim decimalNumber As Integer

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        userInput = Console.ReadLine()

        ' Convert user input to integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the conversion function and display the result
            Dim hexResult As String = ConvertToHex(decimalNumber)
            Console.WriteLine("The hexadecimal equivalent is: " & hexResult)
        Else
            ' Display an error message for invalid input
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If

        ' Wait for user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

