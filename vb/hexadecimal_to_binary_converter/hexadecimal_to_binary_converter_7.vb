' Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
' This program is designed to take a hexadecimal number, that mystical base-16 creation,
' and transform it into the binary realm, where only 0s and 1s reside.
' Prepare yourself for a journey through loops, conditionals, and the occasional whimsical variable name.

Module HexToBinaryConverter

    ' The main entry point of our program, where the magic begins.
    Sub Main()
        ' Declare a variable to store the user's input.
        Dim userInput As String
        ' Prompt the user to enter a hexadecimal number.
        Console.WriteLine("Enter a hexadecimal number, and behold its binary transformation:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal input to binary.
        Dim binaryResult As String = HexToBinary(userInput)

        ' Display the binary result to the user.
        Console.WriteLine("The binary equivalent of your hexadecimal number is: " & binaryResult)

        ' A whimsical pause to allow the user to bask in the glory of their binary number.
        Console.WriteLine("Press any key to exit...")
        Console.ReadKey()
    End Sub

    ' A function that takes a hexadecimal string and returns its binary equivalent.
    Function HexToBinary(ByVal hex As String) As String
        ' Declare a variable to store the binary result.
        Dim binary As String = ""
        ' A variable to store the length of the hexadecimal string.
        Dim lengthOfHex As Integer = hex.Length
        ' Loop through each character in the hexadecimal string.
        For i As Integer = 0 To lengthOfHex - 1
            ' Convert the current character to its binary equivalent.
            Dim currentChar As String = hex.Substring(i, 1)
            Dim binaryChar As String = ConvertHexCharToBinary(currentChar)
            ' Append the binary equivalent to the result.
            binary &= binaryChar
        Next
        ' Return the final binary result.
        Return binary
    End Function

    ' A function that converts a single hexadecimal character to its binary equivalent.
    Function ConvertHexCharToBinary(ByVal hexChar As String) As String
        ' Declare a variable to store the binary equivalent.
        Dim binaryChar As String = ""
        ' Use a Select Case statement to determine the binary equivalent of the hexadecimal character.
        Select Case hexChar.ToUpper()
            Case "0"
                binaryChar = "0000"
            Case "1"
                binaryChar = "0001"
            Case "2"
                binaryChar = "0010"
            Case "3"
                binaryChar = "0011"
            Case "4"
                binaryChar = "0100"
            Case "5"
                binaryChar = "0101"
            Case "6"
                binaryChar = "0110"
            Case "7"
                binaryChar = "0111"
            Case "8"
                binaryChar = "1000"
            Case "9"
                binaryChar = "1001"
            Case "A"
                binaryChar = "1010"
            Case "B"
                binaryChar = "1011"
            Case "C"
                binaryChar = "1100"
            Case "D"
                binaryChar = "1101"
            Case "E"
                binaryChar = "1110"
            Case "F"
                binaryChar = "1111"
            Case Else
                ' If the character is not a valid hexadecimal character, return an empty string.
                binaryChar = ""
        End Select
        ' Return the binary equivalent of the hexadecimal character.
        Return binaryChar
    End Function

End Module

