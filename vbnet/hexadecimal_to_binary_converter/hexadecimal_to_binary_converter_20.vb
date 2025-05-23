' Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
' This program is designed to take a hexadecimal number, that most mystical of numeral systems,
' and transform it into the binary realm, where only 0s and 1s reside.
' Prepare yourself for a journey through loops, conditions, and the occasional whimsical variable name.

Module HexToBinaryConverter

    ' The main entry point of our grand program
    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number, and behold its binary transformation:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to binary
        Dim binaryResult As String = HexToBinary(userInput)

        ' Display the binary result to the user
        Console.WriteLine("The binary equivalent is: " & binaryResult)

        ' Await the user's response before closing
        Console.WriteLine("Press any key to exit...")
        Console.ReadKey()
    End Sub

    ' A function to convert hexadecimal to binary
    Function HexToBinary(ByVal hex As String) As String
        ' Declare a variable to hold the binary result
        Dim binary As String = String.Empty

        ' Loop through each character in the hexadecimal string
        For Each hexChar As Char In hex
            ' Convert the current hexadecimal character to its binary equivalent
            Dim binarySegment As String = ConvertHexCharToBinary(hexChar)

            ' Append the binary segment to the result
            binary &= binarySegment
        Next

        ' Return the complete binary string
        Return binary
    End Function

    ' A function to convert a single hexadecimal character to binary
    Function ConvertHexCharToBinary(ByVal hexChar As Char) As String
        ' Declare a variable to hold the binary segment
        Dim binarySegment As String = String.Empty

        ' Use a select case statement to determine the binary equivalent of the hexadecimal character
        Select Case hexChar
            Case "0"
                binarySegment = "0000"
            Case "1"
                binarySegment = "0001"
            Case "2"
                binarySegment = "0010"
            Case "3"
                binarySegment = "0011"
            Case "4"
                binarySegment = "0100"
            Case "5"
                binarySegment = "0101"
            Case "6"
                binarySegment = "0110"
            Case "7"
                binarySegment = "0111"
            Case "8"
                binarySegment = "1000"
            Case "9"
                binarySegment = "1001"
            Case "A", "a"
                binarySegment = "1010"
            Case "B", "b"
                binarySegment = "1011"
            Case "C", "c"
                binarySegment = "1100"
            Case "D", "d"
                binarySegment = "1101"
            Case "E", "e"
                binarySegment = "1110"
            Case "F", "f"
                binarySegment = "1111"
            Case Else
                ' Handle invalid hexadecimal characters
                binarySegment = "????"
        End Select

        ' Return the binary segment
        Return binarySegment
    End Function

End Module

