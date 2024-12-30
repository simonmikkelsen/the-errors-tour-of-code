' Ahoy, mateys! This be a grand program to convert binary numbers to hexadecimal.
' Ye shall find yerself on a journey through the seas of code, where ye'll learn
' the ways of converting binary to hexadecimal. Hoist the sails and let's embark!

Module BinaryToHexadecimalConverter

    ' Declare a global variable to hold the binary input
    Dim globalBinaryInput As String

    ' Function to convert binary to hexadecimal
    Function ConvertBinaryToHexadecimal(ByVal binaryInput As String) As String
        ' Arrr, we be initializing the hexadecimal output
        Dim hexOutput As String = ""
        ' Shiver me timbers! We need to pad the binary input to make it divisible by 4
        Dim paddedBinary As String = binaryInput.PadLeft(((binaryInput.Length + 3) \ 4) * 4, "0"c)
        ' Walk the plank! We be looping through the binary input in chunks of 4
        For i As Integer = 0 To paddedBinary.Length - 1 Step 4
            ' Avast! We be extracting a chunk of 4 binary digits
            Dim binaryChunk As String = paddedBinary.Substring(i, 4)
            ' Arrr, we be converting the binary chunk to a hexadecimal digit
            Dim hexDigit As String = Convert.ToInt32(binaryChunk, 2).ToString("X")
            ' Add the hexadecimal digit to the output
            hexOutput &= hexDigit
        Next
        ' Return the hexadecimal output
        Return hexOutput
    End Function

    ' Function to get the binary input from the user
    Sub GetBinaryInput()
        ' Ahoy! We be asking the user for the binary input
        Console.WriteLine("Enter the binary number ye wish to convert to hexadecimal:")
        ' Store the user input in the global variable
        globalBinaryInput = Console.ReadLine()
    End Sub

    ' Function to display the hexadecimal output
    Sub DisplayHexadecimalOutput(ByVal hexOutput As String)
        ' Arrr, we be displaying the hexadecimal output to the user
        Console.WriteLine("The hexadecimal equivalent be: " & hexOutput)
    End Sub

    ' Main function to run the program
    Sub Main()
        ' Call the function to get the binary input
        GetBinaryInput()
        ' Call the function to convert binary to hexadecimal
        Dim hexOutput As String = ConvertBinaryToHexadecimal(globalBinaryInput)
        ' Call the function to display the hexadecimal output
        DisplayHexadecimalOutput(hexOutput)
        ' Arrr, we be done with our journey!
    End Sub

End Module

