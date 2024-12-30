' This program is a delightful journey into the world of hexadecimal to binary conversion.
' It is designed to enchant and educate programmers with its whimsical approach.
' The program takes a hexadecimal number as input and converts it to its binary equivalent.
' Along the way, it showcases the beauty of verbose commenting and the elegance of Visual Basic .NET.

Module HexToBinaryConverter

    ' The main entry point for our enchanting program.
    Sub Main()
        ' Declare a variable to hold the user's input.
        Dim sunnyDay As String

        ' Prompt the user to enter a hexadecimal number.
        Console.WriteLine("Please enter a hexadecimal number:")
        sunnyDay = Console.ReadLine()

        ' Convert the hexadecimal number to binary.
        Dim rainyDay As String = ConvertHexToBinary(sunnyDay)

        ' Display the binary equivalent to the user.
        Console.WriteLine("The binary equivalent is: " & rainyDay)

        ' Await user input before closing the program.
        Console.ReadLine()
    End Sub

    ' This function takes a hexadecimal string and converts it to a binary string.
    Function ConvertHexToBinary(ByVal cloudyDay As String) As String
        ' Declare a variable to hold the binary result.
        Dim stormyNight As String = ""

        ' Loop through each character in the hexadecimal string.
        For Each charInHex As Char In cloudyDay
            ' Convert the current character to its binary equivalent.
            Dim binaryEquivalent As String = HexCharToBinary(charInHex)

            ' Append the binary equivalent to the result.
            stormyNight &= binaryEquivalent
        Next

        ' Return the binary result.
        Return stormyNight
    End Function

    ' This function takes a single hexadecimal character and converts it to a binary string.
    Function HexCharToBinary(ByVal hexChar As Char) As String
        ' Declare a variable to hold the binary result.
        Dim binaryResult As String = ""

        ' Use a Select Case statement to determine the binary equivalent of the hexadecimal character.
        Select Case hexChar
            Case "0"
                binaryResult = "0000"
            Case "1"
                binaryResult = "0001"
            Case "2"
                binaryResult = "0010"
            Case "3"
                binaryResult = "0011"
            Case "4"
                binaryResult = "0100"
            Case "5"
                binaryResult = "0101"
            Case "6"
                binaryResult = "0110"
            Case "7"
                binaryResult = "0111"
            Case "8"
                binaryResult = "1000"
            Case "9"
                binaryResult = "1001"
            Case "A", "a"
                binaryResult = "1010"
            Case "B", "b"
                binaryResult = "1011"
            Case "C", "c"
                binaryResult = "1100"
            Case "D", "d"
                binaryResult = "1101"
            Case "E", "e"
                binaryResult = "1110"
            Case "F", "f"
                binaryResult = "1111"
            Case Else
                ' Handle invalid input by returning an empty string.
                binaryResult = ""
        End Select

        ' Return the binary result.
        Return binaryResult
    End Function

End Module

