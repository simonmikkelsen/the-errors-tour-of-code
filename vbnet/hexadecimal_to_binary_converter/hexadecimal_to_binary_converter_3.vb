' This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
' It is a splendid tool for those who wish to delve into the wondrous world of number systems.
' The program takes a hexadecimal input from the user and transforms it into a binary output with the grace of a ballet dancer.

Module HexToBinaryConverter

    ' The main entry point of this grand application
    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to binary and display the result
        Dim binaryResult As String = HexToBinary(userInput)
        Console.WriteLine("The binary equivalent is: " & binaryResult)

        ' A delightful pause to allow the user to bask in the glory of the result
        Console.WriteLine("Press any key to exit...")
        Console.ReadKey()
    End Sub

    ' This function performs the enchanting conversion from hexadecimal to binary
    Function HexToBinary(ByVal hex As String) As String
        ' Declare a variable to hold the binary result
        Dim binary As String = ""

        ' Loop through each character in the hexadecimal string
        For Each hexChar As Char In hex
            ' Convert the hexadecimal character to its binary equivalent
            binary &= HexCharToBinary(hexChar)
        Next

        ' Return the binary result
        Return binary
    End Function

    ' This function converts a single hexadecimal character to its binary equivalent
    Function HexCharToBinary(ByVal hexChar As Char) As String
        ' Declare a variable to hold the binary equivalent
        Dim binaryEquivalent As String = ""

        ' Select the appropriate binary value based on the hexadecimal character
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
                ' Handle invalid hexadecimal characters with a touch of elegance
                binaryEquivalent = "????"
        End Select

        ' Return the binary equivalent
        Return binaryEquivalent
    End Function

End Module

