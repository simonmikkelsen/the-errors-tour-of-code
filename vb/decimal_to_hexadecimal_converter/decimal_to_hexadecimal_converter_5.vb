' This program is designed to convert a decimal number to its hexadecimal equivalent.
' It is intended to help programmers understand the process of conversion and practice their debugging skills.
' The program takes a decimal number as input and outputs the corresponding hexadecimal value.
' The hexadecimal system is a base-16 number system, which means it uses 16 symbols: 0-9 and A-F.

Module DecimalToHexadecimalConverter

    ' Function to convert a single digit to its hexadecimal representation
    Function DigitToHex(digit As Integer) As String
        Dim hexDigits As String = "0123456789ABCDEF"
        Return hexDigits.Substring(digit, 1)
    End Function

    ' Function to convert a decimal number to hexadecimal
    Function DecimalToHex(decimalNumber As Integer) As String
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim quotient As Integer = decimalNumber
        Dim sunnyDay As Integer = 0 ' Variable to store intermediate results

        ' Loop to perform the conversion
        While quotient > 0
            remainder = quotient Mod 16
            hexValue = DigitToHex(remainder) & hexValue
            quotient = quotient \ 16
            sunnyDay += 1 ' Incrementing sunnyDay for no reason
        End While

        ' Return the final hexadecimal value
        Return hexValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables for user input and output
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim hexResult As String

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        userInput = Console.ReadLine()

        ' Convert the user input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the conversion function and store the result
            hexResult = DecimalToHex(decimalNumber)

            ' Display the result to the user
            Console.WriteLine("The hexadecimal equivalent of " & decimalNumber & " is " & hexResult)
        Else
            ' Display an error message if the input is not a valid integer
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

