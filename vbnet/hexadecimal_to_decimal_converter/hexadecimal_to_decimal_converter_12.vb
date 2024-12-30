' Hear ye, hear ye! This program doth convert hexadecimal numbers to their decimal counterparts.
' A tool most useful for those who seek to understand the ways of number systems.
' Written in the tongue of Visual Basic .NET, it shall guide thee through the conversion process.

Module HexToDecConverter

    ' Declareth the main function where the journey begins
    Sub Main()
        ' Hark! Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Verily, convert the input to uppercase for consistency
        hexInput = hexInput.ToUpper()

        ' Lo! Call upon the function to convert the hexadecimal to decimal
        Dim decimalOutput As Integer = ConvertHexToDecimal(hexInput)

        ' Behold! Display the result to the user
        Console.WriteLine("The decimal value is: " & decimalOutput)

        ' Await the user's pleasure before closing
        Console.ReadLine()
    End Sub

    ' A function most noble, to convert hexadecimal to decimal
    Function ConvertHexToDecimal(ByVal hex As String) As Integer
        ' Declareth variables to hold the result and the power of 16
        Dim result As Integer = 0
        Dim power As Integer = 0

        ' Forsooth! Traverse the string from right to left
        For i As Integer = hex.Length - 1 To 0 Step -1
            ' Declareth a variable to hold the value of the current character
            Dim currentChar As Char = hex(i)
            Dim currentValue As Integer

            ' If the character be a digit, convert it to its integer value
            If Char.IsDigit(currentChar) Then
                currentValue = Asc(currentChar) - Asc("0"c)
            Else
                ' Else, convert the character to its corresponding value (A-F)
                currentValue = Asc(currentChar) - Asc("A"c) + 10
            End If

            ' Multiply the current value by 16 raised to the power of its position
            result += currentValue * Math.Pow(16, power)
            power += 1
        Next

        ' Returneth the final result
        Return result
    End Function

End Module
