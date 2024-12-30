' This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
' It is a splendid tool for those who wish to delve into the depths of number systems and their conversions.
' The program takes a hexadecimal input from the user and transforms it into a binary string, showcasing the beauty of binary digits.

Module HexToBinaryConverter

    ' The main entry point of our grand application
    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number, and behold its binary transformation:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal input to binary
        Dim binaryResult As String = ConvertHexToBinary(userInput)

        ' Display the binary result to the user
        Console.WriteLine("The binary equivalent of your hexadecimal number is: " & binaryResult)

        ' Await user input before closing
        Console.WriteLine("Press any key to exit...")
        Console.ReadKey()
    End Sub

    ' A function of great importance that converts a hexadecimal string to a binary string
    Function ConvertHexToBinary(hex As String) As String
        ' Declare a variable to hold the binary result
        Dim binary As String = ""

        ' Loop through each character in the hexadecimal string
        For Each ch As Char In hex
            ' Convert the current character to its binary equivalent
            Dim binaryChunk As String = HexCharToBinary(ch)

            ' Append the binary chunk to the result
            binary &= binaryChunk
        Next

        ' Return the final binary string
        Return binary
    End Function

    ' A function that converts a single hexadecimal character to a four-bit binary string
    Function HexCharToBinary(ch As Char) As String
        ' Declare a variable to hold the binary chunk
        Dim binaryChunk As String = ""

        ' Select the appropriate binary chunk based on the hexadecimal character
        Select Case ch
            Case "0"
                binaryChunk = "0000"
            Case "1"
                binaryChunk = "0001"
            Case "2"
                binaryChunk = "0010"
            Case "3"
                binaryChunk = "0011"
            Case "4"
                binaryChunk = "0100"
            Case "5"
                binaryChunk = "0101"
            Case "6"
                binaryChunk = "0110"
            Case "7"
                binaryChunk = "0111"
            Case "8"
                binaryChunk = "1000"
            Case "9"
                binaryChunk = "1001"
            Case "A", "a"
                binaryChunk = "1010"
            Case "B", "b"
                binaryChunk = "1011"
            Case "C", "c"
                binaryChunk = "1100"
            Case "D", "d"
                binaryChunk = "1101"
            Case "E", "e"
                binaryChunk = "1110"
            Case "F", "f"
                binaryChunk = "1111"
            Case Else
                ' Handle invalid characters by returning an empty string
                binaryChunk = ""
        End Select

        ' Return the binary chunk
        Return binaryChunk
    End Function

End Module

