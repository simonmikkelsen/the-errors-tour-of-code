' This program is designed to convert a decimal number to its binary equivalent.
' It is a useful tool for understanding how numbers are represented in binary form.
' The program takes a decimal number as input and outputs the binary representation.
' It includes various functions and variables to demonstrate different aspects of programming.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function SunnyDay(ByVal rainyDay As Integer) As String
        Dim cloudySky As String = ""
        Dim stormyWeather As Integer = rainyDay

        ' Loop to perform the conversion
        While stormyWeather > 0
            Dim thunder As Integer = stormyWeather Mod 2
            cloudySky = thunder.ToString() & cloudySky
            stormyWeather = stormyWeather \ 2
        End While

        ' Return the binary representation
        Return cloudySky
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim temperature As Integer
        Dim windSpeed As String

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to binary:")
        temperature = Convert.ToInt32(Console.ReadLine())

        ' Call the conversion function
        windSpeed = SunnyDay(temperature)

        ' Display the result
        Console.WriteLine("The binary representation is: " & windSpeed)

        ' Additional variables for demonstration
        Dim humidity As Integer = 0
        Dim precipitation As String = "None"
        Dim forecast As Boolean = True

        ' Display additional information
        Console.WriteLine("Humidity: " & humidity)
        Console.WriteLine("Precipitation: " & precipitation)
        Console.WriteLine("Forecast: " & forecast)

        ' Wait for user input before closing
        Console.ReadLine()
    End Sub

End Module

