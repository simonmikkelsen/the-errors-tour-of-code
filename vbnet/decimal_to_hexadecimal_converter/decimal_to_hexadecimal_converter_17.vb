' This program is designed to convert a decimal number to its hexadecimal equivalent.
' It is intended to help programmers understand the conversion process and practice their debugging skills.
' The program takes user input, processes it, and outputs the hexadecimal representation.
' Along the way, it performs various operations to demonstrate different aspects of programming in Visual Basic .NET.

Module DecimalToHexadecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for user input and output
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim hexResult As String

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        userInput = Console.ReadLine()

        ' Convert the input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Perform the conversion
            hexResult = ConvertToHex(decimalNumber)

            ' Display the result
            Console.WriteLine("The hexadecimal equivalent is: " & hexResult)
        Else
            ' Handle invalid input
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If

        ' Wait for user to acknowledge the result
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to hexadecimal
    Function ConvertToHex(ByVal decimalNumber As Integer) As String
        ' Declare variables for the conversion process
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim tempDecimal As Integer = decimalNumber

        ' Loop to perform the conversion
        While tempDecimal > 0
            remainder = tempDecimal Mod 16
            hexValue = GetHexCharacter(remainder) & hexValue
            tempDecimal = tempDecimal \ 16
        End While

        ' Return the result
        Return hexValue
    End Function

    ' Function to get the hexadecimal character for a given value
    Function GetHexCharacter(ByVal value As Integer) As String
        ' Declare a variable for the result
        Dim hexChar As String

        ' Determine the hexadecimal character
        Select Case value
            Case 0 To 9
                hexChar = value.ToString()
            Case 10
                hexChar = "A"
            Case 11
                hexChar = "B"
            Case 12
                hexChar = "C"
            Case 13
                hexChar = "D"
            Case 14
                hexChar = "E"
            Case 15
                hexChar = "F"
            Case Else
                hexChar = "?"
        End Select

        ' Return the result
        Return hexChar
    End Function

    ' Function to write internal