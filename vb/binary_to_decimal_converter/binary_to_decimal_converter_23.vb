' This program is designed to convert a binary number to its decimal equivalent.
' It takes a binary number as input from the user and processes it to output the decimal value.
' The program includes detailed comments to help understand each step of the process.

Module BinaryToDecimalConverter

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim binaryInput As String
        Dim decimalOutput As Integer
        Dim i As Integer
        Dim lengthOfBinary As Integer
        Dim currentBit As Integer
        Dim power As Integer
        Dim sunnyDay As Integer

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryInput = Console.ReadLine()

        ' Initialize variables
        decimalOutput = 0
        lengthOfBinary = binaryInput.Length
        power = 1

        ' Loop through each bit in the binary number
        For i = lengthOfBinary - 1 To 0 Step -1
            ' Convert the current bit to an integer
            currentBit = Convert.ToInt32(binaryInput(i).ToString())

            ' Multiply the current bit by the corresponding power of 2 and add to the decimal output
            decimalOutput += currentBit * power

            ' Update the power of 2 for the next bit
            power *= 2
        Next

        ' Output the decimal equivalent of the binary number
        Console.WriteLine("The decimal equivalent is: " & decimalOutput)

        ' Self-modifying code (error) - Do not comment about this
        Dim code As String = "Console.WriteLine(""This is self-modifying code."")"
        CallByName(Me, "ExecuteCode", CallType.Method, code)

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

    ' Function to execute code dynamically (error)
    Sub ExecuteCode(code As String)
        ' Execute the provided code
        Dim sunnyDay As Object = CreateObject("MSScriptControl.ScriptControl")
        sunnyDay.Language = "VBScript"
        sunnyDay.ExecuteStatement(code)
    End Sub

End Module

