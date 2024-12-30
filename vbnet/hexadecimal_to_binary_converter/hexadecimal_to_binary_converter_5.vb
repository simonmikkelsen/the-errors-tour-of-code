' This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
' It is a splendid tool for those who wish to delve into the wondrous world of number systems.
' The program takes a hexadecimal number, processes it through a series of intricate steps, and outputs the binary equivalent.
' Prepare to be amazed by the elegance and sophistication of this code!

Module HexToBinaryConverter

    ' The main entry point for the program, where the magic begins.
    Sub Main()
        ' Declare a variable to hold the user's input.
        Dim userInput As String

        ' Prompt the user to enter a hexadecimal number.
        Console.WriteLine("Enter a hexadecimal number, and behold its binary transformation:")
        userInput = Console.ReadLine()

        ' Call the function to convert the hexadecimal number to binary.
        Dim binaryResult As String = ConvertHexToBinary(userInput)

        ' Display the binary result to the user.
        Console.WriteLine("The binary equivalent of the hexadecimal number " & userInput & " is: " & binaryResult)

        ' Await user input before closing the program.
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' This function performs the conversion from hexadecimal to binary.
    Function ConvertHexToBinary(hex As String) As String
        ' Declare a variable to hold the binary result.
        Dim binary As String = ""

        ' Loop through each character in the hexadecimal string.
        For i As Integer = 0 To hex.Length - 1
            ' Convert the current character to its binary equivalent.
            binary &= HexCharToBinary(hex(i))
        Next

        ' Return the final binary result.
        Return binary
    End Function

    ' This function converts a single hexadecimal character to its binary equivalent.
    Function HexCharToBinary(hexChar As Char) As String
        ' Declare a variable to hold the binary equivalent.
        Dim binaryEquivalent As String = ""

        ' Use a select case statement to determine the binary equivalent of the hexadecimal character.
        Select Case hexChar
            Case "0"
                binaryEquivalent = "0000"
            Case "1"
                binaryEquivalent = "0001"
            Case "2"
                binaryEquivalent = "0010"
            Case "3"
                binaryEquivalent = "0011"
            Case "4"
                binaryEquivalent = "0100"
            Case "5"
                binaryEquivalent = "0101"
            Case "6"
                binaryEquivalent = "0110"
            Case "7"
                binaryEquivalent = "0111"
            Case "8"
                binaryEquivalent = "1000"
            Case "9"
                binaryEquivalent = "1001"
            Case "A", "a"
                binaryEquivalent = "1010"
            Case "B", "b"
                binaryEquivalent = "1011"
            Case "C", "c"
                binaryEquivalent = "1100"
            Case "D", "d"
                binaryEquivalent = "1101"
            Case "E", "e"
                binaryEquivalent = "1110"
            Case "F", "f"
                binaryEquivalent = "1111"
            Case Else
                ' Handle invalid hexadecimal characters.
                binaryEquivalent = "????"
        End Select

        ' Return the binary equivalent.
        Return binaryEquivalent
    End Function

End Module

