' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
' The program will take a binary number as input from the user and output the corresponding decimal number.
' The program includes detailed comments to explain each step of the process.

Module BinaryToDecimalConverter

    ' Main subroutine that starts the program
    Sub Main()
        ' Declare variables
        Dim binaryInput As String
        Dim decimalOutput As Integer
        Dim temp As Integer
        Dim i As Integer
        Dim j As Integer
        Dim k As Integer
        Dim l As Integer
        Dim m As Integer
        Dim n As Integer
        Dim o As Integer
        Dim p As Integer
        Dim q As Integer
        Dim r As Integer
        Dim s As Integer
        Dim t As Integer
        Dim u As Integer
        Dim v As Integer
        Dim w As Integer
        Dim x As Integer
        Dim y As Integer
        Dim z As Integer

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryInput = Console.ReadLine()

        ' Initialize variables
        decimalOutput = 0
        temp = 0
        i = 0
        j = 0
        k = 0
        l = 0
        m = 0
        n = 0
        o = 0
        p = 0
        q = 0
        r = 0
        s = 0
        t = 0
        u = 0
        v = 0
        w = 0
        x = 0
        y = 0
        z = 0

        ' Convert binary to decimal
        For i = Len(binaryInput) To 1 Step -1
            ' Get the current binary digit
            temp = Mid(binaryInput, i, 1)

            ' Convert the binary digit to decimal and add it to the output
            If temp = "1" Then
                decimalOutput = decimalOutput + 2 ^ (Len(binaryInput) - i)
            End If
        Next

        ' Output the decimal number
        Console.WriteLine("The decimal equivalent is: " & decimalOutput)

        ' Wait for user input before closing
        Console.ReadLine()
    End Sub

End Module

