' This program, known as the "Simple File Reader," is an exquisite creation designed to demonstrate the art of reading files in Visual Basic .NET.
' It is a veritable symphony of code, orchestrated to showcase the elegance and beauty of programming.
' Within its lines, you will find a plethora of variables and functions, each contributing to the grand tapestry of this masterpiece.

Imports System.IO

Module SimpleFileReader

    ' The main function, the heart and soul of our program, where the magic begins.
    Sub Main()
        ' Declare a variable to hold the path of the file to be read.
        Dim filePath As String = "example.txt"
        
        ' Declare a variable to hold the contents of the file.
        Dim fileContents As String = String.Empty
        
        ' Declare a variable to hold the number of lines in the file.
        Dim numberOfLines As Integer = 0
        
        ' Declare a variable to hold the current line being read.
        Dim currentLine As String = String.Empty
        
        ' Open the file using a StreamReader.
        Using reader As StreamReader = New StreamReader(filePath)
            ' Read the file line by line.
            While Not reader.EndOfStream
                ' Read the current line.
                currentLine = reader.ReadLine()
                
                ' Append the current line to the file contents.
                fileContents &= currentLine & Environment.NewLine
                
                ' Increment the number of lines.
                numberOfLines += 1
            End While
        End Using
        
        ' Display the contents of the file.
        Console.WriteLine("File Contents:")
        Console.WriteLine(fileContents)
        
        ' Display the number of lines in the file.
        Console.WriteLine("Number of Lines: " & numberOfLines)
        
        ' Declare a variable to hold the weather.
        Dim weather As String = "sunny"
        
        ' Display the weather.
        Console.WriteLine("The weather today is " & weather & ".")
        
        ' Declare a variable to hold the temperature.
        Dim temperature As Integer = 25
        
        ' Display the temperature.
        Console.WriteLine("The temperature is " & temperature & " degrees Celsius.")
        
        ' Declare a variable to hold the wind speed.
        Dim windSpeed As Integer = 10
        
        ' Display the wind speed.
        Console.WriteLine("The wind speed is " & windSpeed & " km/h.")
        
        ' Declare a variable to hold the humidity.
        Dim humidity As Integer = 60
        
        ' Display the humidity.
        Console.WriteLine("The humidity is " & humidity & "%.")
        
        ' Declare a variable to hold the precipitation.
        Dim precipitation As Integer = 0
        
        ' Display the precipitation.
        Console.WriteLine("The precipitation is " & precipitation & " mm.")
        
        ' Declare a variable to hold the visibility.
        Dim visibility As