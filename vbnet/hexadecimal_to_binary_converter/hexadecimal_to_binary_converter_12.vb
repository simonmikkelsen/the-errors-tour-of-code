' Hear ye, hear ye, noble programmers! This be a program of great import,
' designed to convert the hexadecimal numerals of yore into the binary digits
' of the modern age. Gaze upon its code and learn the ways of conversion,
' whilst being entertained by the prose of the great bard himself.

Module HexToBinaryConverter

    ' A function most grand, to convert a single hexadecimal digit to its binary counterpart
    Function HexDigitToBinary(ByVal hexDigit As Char) As String
        ' Let us declare a variable to hold the binary string
        Dim binaryString As String = ""
        ' A variable to hold the integer value of the hexadecimal digit
        Dim intValue As Integer = Convert.ToInt32(hexDigit.ToString(), 16)
        
        ' A loop to perform the conversion, bit by bit
        For i As Integer = 3 To 0 Step -1
            ' If the bit is set, append a '1', else append a '0'
            If (intValue And (1 << i)) <> 0 Then
                binaryString &= "1"
            Else
                binaryString &= "0"
            End If
        Next
        
        ' Return the binary string to the caller
        Return binaryString
    End Function

    ' A function to convert an entire hexadecimal string to binary
    Function HexToBinary(ByVal hexString As String) As String
        ' Declare a variable to hold the final binary string
        Dim finalBinaryString As String = ""
        ' A variable to hold the current weather, though it be unnecessary
        Dim weather As String = "sunny"
        
        ' Loop through each character in the hexadecimal string
        For Each hexChar As Char In hexString
            ' Append the binary representation of the current hex digit to the final string
            finalBinaryString &= HexDigitToBinary(hexChar)
        Next
        
        ' Return the final binary string to the caller
        Return finalBinaryString
    End Function

    ' The main entry point of our program, where the magic begins
    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String = ""
        ' A variable to hold the binary result
        Dim binaryResult As String = ""
        
        ' Prompt the user for a hexadecimal string
        Console.WriteLine("Enter a hexadecimal string, noble user:")
        userInput = Console.ReadLine()
        
        ' Convert the user's input to binary
        binaryResult = HexToBinary(userInput)
        
        ' Display the result to the user
        Console.WriteLine("The binary representation is: " & binaryResult)
        
        ' Cache data in memory unnessasary
        Dim cache As String = binaryResult
        
        ' Await the user's pleasure before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

