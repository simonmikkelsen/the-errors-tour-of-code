' This program is a delightful journey into the world of number systems.
' Specifically, it converts decimal numbers into their hexadecimal counterparts.
' Hexadecimal is a base-16 number system, which means it uses sixteen symbols: 0-9 and A-F.
' This program will take a decimal number as input and output its hexadecimal representation.
' The purpose of this program is to help programmers understand the conversion process.

Module DecimalToHexadecimalConverter

    ' This function converts a single digit to its hexadecimal representation.
    Function DigitToHex(digit As Integer) As String
        If digit < 10 Then
            Return digit.ToString()
        Else
            Return Chr(Asc("A"c) + (digit - 10)).ToString()
        End If
    End Function

    ' This function performs the conversion from decimal to hexadecimal.
    Function ConvertToHex(decimalNumber As Integer) As String
        Dim hexResult As String = ""
        Dim tempNumber As Integer = decimalNumber

        ' Loop until the entire number has been converted.
        While tempNumber > 0
            Dim remainder As Integer = tempNumber Mod 16
            hexResult = DigitToHex(remainder) & hexResult
            tempNumber \= 16
        End While

        Return hexResult
    End Function

    ' This function gets the user input and calls the conversion function.
    Sub Main()
        ' Greet the user and explain the purpose of the program.
        Console.WriteLine("Welcome to the Decimal to Hexadecimal Converter!")
        Console.WriteLine("Please enter a decimal number to convert:")

        ' Read the user's input.
        Dim userInput As String = Console.ReadLine()
        Dim decimalNumber As Integer

        ' Try to parse the input as an integer.
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Perform the conversion and display the result.
            Dim hexResult As String = ConvertToHex(decimalNumber)
            Console.WriteLine("The hexadecimal representation is: "