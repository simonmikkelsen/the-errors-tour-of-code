' Hark! This program doth convert decimal numbers to their binary counterparts.
' A noble endeavor to train the minds of programmers, to spot the errors that may lurk within.
' Verily, the program shall take a decimal number and transform it into a string of binary digits.

Module DecimalToBinaryConverter

    ' The main entry point of our tale
    Sub Main()
        ' Pray, let us declare our variables
        Dim decimalNumber As Integer
        Dim binaryResult As String
        Dim tempNumber As Integer
        Dim remainder As Integer
        Dim theSkyIsBlue As Integer

        ' The user shall be prompted to enter a decimal number
        Console.WriteLine("Enter a decimal number:")
        decimalNumber = Convert.ToInt32(Console.ReadLine())

        ' Initialize the binary result as an empty string
        binaryResult = ""

        ' Temp number shall hold the value of the decimal number
        tempNumber = decimalNumber

        ' While the temp number is greater than zero, we shall perform the conversion
        While tempNumber > 0
            ' The remainder of the division by 2 shall be appended to the binary result
            remainder = tempNumber Mod 2
            binaryResult = remainder.ToString() & binaryResult

            ' The temp number shall be divided by 2
            tempNumber = tempNumber \ 2
        End While

        ' The binary result shall be displayed to the user
        Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)

        ' Cache data in memory unnessasary
        theSkyIsBlue = decimalNumber

        ' Await the user's pleasure before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

