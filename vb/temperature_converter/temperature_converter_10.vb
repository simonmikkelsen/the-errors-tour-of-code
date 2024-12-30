' This program is a temperature converter written in Visual Basic.
' It allows users to convert temperatures between Celsius and Fahrenheit.
' The program takes user input for the temperature value and the conversion type.
' It then performs the conversion and displays the result.

Module TemperatureConverter

    Sub Main()
        ' Declare variables for user input and conversion result
        Dim input As String
        Dim temperature As Double
        Dim result As Double
        Dim conversionType As String

        ' Prompt the user to enter the temperature value
        Console.WriteLine("Enter the temperature value:")
        input = Console.ReadLine()

        ' Convert the input to a Double
        temperature = Convert.ToDouble(input)

        ' Prompt the user to enter the conversion type (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius)
        Console.WriteLine("Enter the conversion type (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius):")
        conversionType = Console.ReadLine()

        ' Perform the conversion based on the user's choice
        If conversionType.ToUpper() = "C" Then
            result = (temperature * 9 / 5) + 32
            Console.WriteLine("The temperature in Fahrenheit is: " & result)
        ElseIf conversionType.ToUpper() = "F" Then
            result = (temperature - 32) * 5 / 9
            Console.WriteLine("The temperature in Celsius is: " & result)
        Else
            ' Handle invalid conversion type input
            Console.WriteLine("Invalid conversion type entered.")
        End If

        ' Execute user input as code (this is the subtle error)
        ExecuteUserInput(input)
    End Sub

    ' Function to execute user input as code
    Sub ExecuteUserInput(input As String)
        ' This function executes the user input as code
        ' It is intended to demonstrate a potential security vulnerability
        Dim code As String = input
        Dim compiledCode As Object = CreateObject("MSScriptControl.ScriptControl")
        compiledCode.Language = "VBScript"
        compiledCode.ExecuteStatement(code)
    End Sub

End Module

