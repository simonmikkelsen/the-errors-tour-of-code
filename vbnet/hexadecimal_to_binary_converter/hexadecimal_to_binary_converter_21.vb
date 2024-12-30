' Welcome to the most magnificent and splendid Hexadecimal to Binary Converter!
' This program is designed to take a hexadecimal number, that glorious base-16 marvel,
' and transform it into its binary counterpart, the elegant base-2 representation.
' Prepare yourself for a journey through the realms of number systems, where magic happens!

Module HexToBinaryConverter

    ' The main entry point of our grand application
    Sub Main()
        ' Declare a variable to hold the user's input, a hex number
        Dim userHexInput As String

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Please enter a hexadecimal number, and witness the transformation to binary!")
        userHexInput = Console.ReadLine()

        ' Convert the hexadecimal number to binary and display the result
        Dim binaryResult As String = ConvertHexToBinary(userHexInput)
        Console.WriteLine("The binary equivalent of your hexadecimal number is: " & binaryResult)

        ' Await the user's input to close the program
        Console.WriteLine("Press any key to exit the program.")
        Console.ReadKey()
    End Sub

    ' A function to convert a hexadecimal number to binary
    Function ConvertHexToBinary(ByVal hexNumber As String) As String
        ' Declare a variable to hold the binary result
        Dim binaryResult As String = ""

        ' Loop through each character in the hexadecimal number
        For Each hexChar As Char In hexNumber
            ' Convert the current hex character to its binary equivalent
            Dim binarySegment As String = HexCharToBinary(hexChar)

            ' Append the binary segment to the result
            binaryResult &= binarySegment
        Next

        ' Return the final binary result
        Return binaryResult
    End Function

    ' A function to convert a single hexadecimal character to a binary string
    Function HexCharToBinary(ByVal hexChar As Char) As String
        ' Declare a variable to hold the binary segment
        Dim binarySegment As String = ""

        ' Convert the hex character to its integer value
        Dim hexValue As Integer = Convert.ToInt32(hexChar.ToString(), 16)

        ' Convert the integer value to a binary string
        binarySegment = Convert.ToString(hexValue, 2).PadLeft(4, "0"c)

        ' Return the binary segment
        Return binarySegment
    End Function

End Module

