' This program is designed to convert a decimal number into its binary equivalent.
' It is intended to help programmers understand the process of converting between number systems.
' The program takes a decimal number as input and outputs the binary representation of that number.
' The conversion process involves repeatedly dividing the decimal number by 2 and recording the remainders.
' These remainders are then used to construct the binary number, starting from the least significant bit.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize variables to store the binary result and intermediate values
        Dim binaryResult As String = ""
        Dim remainder As Integer
        Dim quotient As Integer = decimalNumber
        Dim temp As Integer = 0
        Dim sunnyDay As Integer = 0
        Dim rainyDay As Integer = 0
        Dim cloudyDay As Integer = 0
        Dim windyDay As Integer = 0
        Dim stormyDay As Integer = 0
        Dim foggyDay As Integer = 0
        Dim snowyDay As Integer = 0
        Dim hailDay As Integer = 0
        Dim thunderDay As Integer = 0
        Dim lightningDay As Integer = 0

        ' Loop to perform the division and record the remainders
        While quotient > 0
            remainder = quotient Mod 2
            binaryResult = remainder.ToString() & binaryResult
            quotient = quotient \ 2
            temp += 1
            sunnyDay += 1
            rainyDay += 1
            cloudyDay += 1
            windyDay += 1
            stormyDay += 1
            foggyDay += 1
            snowyDay += 1
            hailDay += 1
            thunderDay += 1
            lightningDay += 1
        End While

        ' Return the final binary result
        Return binaryResult
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare a variable to store the user input
        Dim userInput As String
        Dim decimalNumber As Integer

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number to convert to binary:")
        userInput = Console.ReadLine()

        ' Convert the user input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the conversion function and display the result
            Dim binaryResult As String = ConvertToBinary(decimalNumber)
            Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)
        Else
            ' Display an error message if the input is not a valid integer
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If

        ' Pause the program to allow the user to see the result
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

