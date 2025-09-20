' Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
' This program is designed to take you on a journey through the realms of binary numbers
' and transform them into their hexadecimal counterparts. Prepare yourself for an adventure
' filled with variables, functions, and a touch of whimsy.

Module BinaryToHexConverter

    ' The main entry point of our program, where the magic begins.
    Sub Main()
        ' Declare a variable to hold the binary input from the user.
        Dim binaryInput As String

        ' Prompt the user to enter a binary number.
        Console.WriteLine("Enter a binary number to convert to hexadecimal:")
        binaryInput = Console.ReadLine()

        ' Call the function to convert the binary input to hexadecimal.
        Dim hexOutput As String = ConvertBinaryToHex(binaryInput)

        ' Display the resulting hexadecimal number to the user.
        Console.WriteLine("The hexadecimal equivalent is: " & hexOutput)

        ' Await the user's response before closing the program.
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' This function takes a binary string and converts it to a hexadecimal string.
    Function ConvertBinaryToHex(ByVal binary As String) As String
        ' Declare a variable to hold the hexadecimal result.
        Dim hexResult As String = ""

        ' Ensure the binary string length is a multiple of 4 by padding with leading zeros.
        Dim paddedBinary As String = binary.PadLeft(((binary.Length + 3) \ 4) * 4, "0"c)

        ' Loop through the binary string in chunks of 4 bits.
        For i As Integer = 0 To paddedBinary.Length - 1 Step 4
            ' Extract a chunk of 4 bits.
            Dim binaryChunk As String = paddedBinary.Substring(i, 4)

            ' Convert the binary chunk to a decimal number.
            Dim decimalValue As Integer = Convert.ToInt32(binaryChunk, 2)

            ' Convert the decimal number to a hexadecimal digit and append to the result.
            hexResult &= decimalValue.ToString("X")
        Next

        ' Return the final hexadecimal result.
        Return hexResult
    End Function

End Module

