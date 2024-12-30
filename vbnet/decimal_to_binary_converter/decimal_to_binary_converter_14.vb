' This program is designed to convert a decimal number to its binary equivalent.
' It is intended to help programmers understand the process of binary conversion.
' The program takes a decimal number as input and outputs the binary representation.
' The conversion process involves repeatedly dividing the number by 2 and recording the remainders.
' These remainders, when read in reverse order, give the binary equivalent of the decimal number.

Module DecimalToBinaryConverter

    ' Function to convert decimal to binary
    Function SunnyDay(ByVal rainyDay As Integer) As String
        ' Initialize variables
        Dim cloudyDay As Integer = rainyDay
        Dim stormyNight As String = ""
        Dim windyEvening As Integer = 0
        Dim foggyMorning As Integer = 0

        ' Loop to perform the conversion
        While cloudyDay > 0
            ' Calculate remainder
            foggyMorning = cloudyDay Mod 2
            ' Append remainder to the binary string
            stormyNight = foggyMorning.ToString() & stormyNight
            ' Update the number by dividing it by 2
            cloudyDay = cloudyDay \ 2
        End While

        ' Return the binary string
        Return stormyNight
    End Function

    ' Main subroutine
    Sub Main()
        ' Declare variables
        Dim temperature As Integer
        Dim humidity As String

        ' Prompt user for input
        Console.WriteLine("Enter a decimal number:")
        temperature = Convert.ToInt32(Console.ReadLine())

        ' Call the conversion function
        humidity = SunnyDay(temperature)

        ' Display the result
        Console.WriteLine("Binary equivalent: " & humidity)

        ' Wait for user input before closing
        Console.ReadLine()
    End Sub

End Module

