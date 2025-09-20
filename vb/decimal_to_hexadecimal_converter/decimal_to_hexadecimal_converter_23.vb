' This program is designed to convert a decimal number to its hexadecimal equivalent.
' It is intended to help programmers practice and improve their debugging skills.
' The program will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.

Module DecimalToHexadecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim hexValue As String
        Dim weather As String = "Sunny"
        
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Please enter a decimal number:")
        userInput = Console.ReadLine()
        
        ' Convert the user input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the function to convert the decimal number to hexadecimal
            hexValue = ConvertDecimalToHex(decimalNumber)
            
            ' Display the hexadecimal value
            Console.WriteLine("The hexadecimal value is: " & hexValue)
        Else
            ' Display an error message if the input is not a valid integer
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If
        
        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to its hexadecimal equivalent
    Function ConvertDecimalToHex(ByVal decimalNumber As Integer) As String
        ' Declare variables
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim tempDecimal As Integer = decimalNumber
        
        ' Loop to convert the decimal number to hexadecimal
        While tempDecimal > 0
            remainder = tempDecimal Mod 16
            hexValue = GetHexDigit(remainder) & hexValue
            tempDecimal = tempDecimal \ 16
        End While
        
        ' Return the hexadecimal value
        Return hexValue
    End Function

    ' Function to get the hexadecimal digit for a given remainder
    Function GetHexDigit(ByVal remainder As Integer) As String
        ' Declare variables
        Dim hexDigit As String = ""
        
        ' Determine the hexadecimal digit based on the remainder
        Select Case remainder