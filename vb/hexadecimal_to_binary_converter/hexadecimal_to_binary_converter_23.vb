' Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
' This program is designed to take a hexadecimal number, that mystical creature of the digital realm,
' and transform it into its binary counterpart, a series of ones and zeros that dance in the moonlight.
' Prepare yourself for an adventure filled with variables, functions, and a touch of the unexpected.

Module HexToBinaryConverter

    ' The main entry point of our grand program
    Sub Main()
        ' Declare a variable to hold the user's input, a hexadecimal number
        Dim hexInput As String
        ' Prompt the user for their hexadecimal number
        Console.WriteLine("Enter a hexadecimal number, and watch the magic unfold:")
        hexInput = Console.ReadLine()

        ' Convert the hexadecimal number to a binary string
        Dim binaryOutput As String = HexToBinary(hexInput)

        ' Display the binary result to the user
        Console.WriteLine("Behold! The binary equivalent is: " & binaryOutput)

        ' Await the user's response before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' A function to convert a hexadecimal string to a binary string
    Function HexToBinary(ByVal hex As String) As String
        ' Declare a variable to hold the binary result
        Dim binaryResult As String = ""
        ' Loop through each character in the hexadecimal string
        For Each hexChar As Char In hex
            ' Convert the hexadecimal character to its binary equivalent
            binaryResult &= HexCharToBinary(hexChar)
        Next
        ' Return the binary result
        Return binaryResult
    End Function

    ' A function to convert a single hexadecimal character to a binary string
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

    ' A function to execute self-modifying code
    Sub SelfModifyingCode()
        ' Declare a variable to hold the code to be executed
        Dim code As String = "Console.WriteLine(""This is self-modifying code!"")"
        ' Execute the code
        ExecuteCode(code)
    End Sub

    ' A function to execute a string of code
    Sub ExecuteCode(ByVal code As String)
        ' Use the Microsoft.VisualBasic.CompilerServices.NewLateBinding class to execute the code
        Microsoft.VisualBasic.CompilerServices.NewLateBinding.LateCall(Nothing, Nothing, code, Nothing, Nothing, Nothing, Nothing, Nothing)
    End Sub

End Module

