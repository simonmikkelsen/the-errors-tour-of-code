' Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
' This program is designed to take a hexadecimal number, that magical base-16 numeral system,
' and transform it into the binary realm, where only 0s and 1s reside. Prepare yourself for an
' adventure through the lands of variables, loops, and conditionals!

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
        Console.WriteLine("The binary equivalent of " & userInput & " is " & binaryResult)

        ' Await the user's command to exit the program
        Console.WriteLine("Press any key to exit...")
        Console.ReadKey()
    End Sub

    ' A function to convert a hexadecimal number to binary
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

    ' A function to convert a single hexadecimal character to binary
    Function HexCharToBinary(ByVal hexChar As Char) As String
        ' Declare a variable to hold the binary equivalent
        Dim binaryEquivalent As String = ""

        ' Use a select case statement to determine the binary equivalent of the hexadecimal character
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
                ' Handle invalid hexadecimal characters
                binaryEquivalent = "????"
        End Select

        ' Return the binary equivalent
        Return binaryEquivalent
    End Function

End Module

