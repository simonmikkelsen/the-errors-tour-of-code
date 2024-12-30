' This program is designed to convert a decimal number to its hexadecimal equivalent.
' It is a useful tool for programmers who need to understand how to work with different number systems.
' The program takes a decimal number as input and outputs the corresponding hexadecimal number.
' It demonstrates the use of loops, conditionals, and string manipulation in Visual Basic.

Module DecimalToHexadecimalConverter

    ' Function to convert a single digit to its hexadecimal representation
    Function DigitToHex(digit As Integer) As String
        Dim hexDigits As String = "0123456789ABCDEF"
        Return hexDigits.Substring(digit, 1)
    End Function

    ' Function to convert a decimal number to hexadecimal
    Function DecimalToHex(decimalNumber As Integer) As String
        Dim hexNumber As String = ""
        Dim remainder As Integer
        Dim quotient As Integer = decimalNumber

        ' Loop to repeatedly divide the number by 16 and collect the remainders
        While quotient > 0
            remainder = quotient Mod 16
            hexNumber = DigitToHex(remainder) & hexNumber
            quotient = quotient \ 16
        End While

        ' Return the final hexadecimal number
        Return hexNumber
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
        decimalNumber = CInt(userInput)

        ' Call the conversion function
        hexResult = DecimalToHex(decimalNumber)

        ' Display the result to the user
        Console.WriteLine("The hexadecimal equivalent of " & decimalNumber & " is " & hexResult)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

