' This program is a delightful journey into the world of number systems.
' It takes a decimal number, a humble integer, and transforms it into a hexadecimal number,
' a more exotic and colorful representation. This metamorphosis is achieved through the magic of Visual Basic .NET.
' Along the way, we will encounter various whimsical variables and fanciful functions.

Module DecimalToHexadecimalConverter

    ' The main entry point of our program, where the adventure begins.
    Sub Main()
        ' Declare a variable to store the user's input, a number from the realm of decimals.
        Dim userInput As String
        ' A variable to store the converted number, now in the land of hexadecimals.
        Dim hexOutput As String

        ' Prompt the user for a decimal number, a simple request to start our journey.
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        userInput = Console.ReadLine()

        ' Convert the user's input to an integer, preparing it for transformation.
        Dim decimalNumber As Integer = Convert.ToInt32(userInput)

        ' Call the function that performs the magical conversion.
        hexOutput = ConvertDecimalToHex(decimalNumber)

        ' Display the result to the user, revealing the hexadecimal wonder.
        Console.WriteLine("The hexadecimal representation is: " & hexOutput)

        ' Await the user's response before ending the program, allowing time to marvel at the result.
        Console.ReadLine()
    End Sub

    ' This function performs the enchanting conversion from decimal to hexadecimal.
    ' It takes an integer from the mundane world of decimals and returns a string from the vibrant realm of hexadecimals.
    Function ConvertDecimalToHex(ByVal decimalNumber As Integer) As String
        ' A variable to store the hexadecimal result, initially an empty string.
        Dim hexResult As String = String.Empty
        ' A variable to store the remainder of the division, a key part of the conversion process.
        Dim remainder As Integer

        ' A loop that continues until the decimal number has been fully transformed.
        While decimalNumber > 0
            ' Calculate the remainder of the division by 16, a crucial step in the conversion.
            remainder = decimalNumber Mod 16
            ' Convert the remainder to its hexadecimal equivalent and append it to the result.
            hexResult = GetHexCharacter(remainder) & hexResult
            ' Divide the decimal number by 16, moving to the next digit in the conversion.
            decimalNumber = decimalNumber \ 16
        End While

        ' Return the final hexadecimal result, a string of vibrant characters.
        Return hexResult
    End Function

    ' This function takes a number between 0 and 15 and returns its hexadecimal character.
    ' It is a small but essential part of the conversion process, translating numbers to their hexadecimal counterparts.
    Function GetHexCharacter(ByVal number As Integer) As String
        ' A variable to store the hexadecimal character, initially an empty string.
        Dim hexChar As String = String.Empty

        ' A select case statement to determine the correct hexadecimal character.
        Select Case number
            Case 0 To 9
                ' For numbers 0 to 9, the character is the same as the number.
                hexChar = number.ToString()
            Case 10
                hexChar