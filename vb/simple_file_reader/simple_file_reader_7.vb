' Welcome, dear programmer, to the wondrous world of file reading in Visual Basic!
' This program is designed to take you on a journey through the intricate process of reading a file.
' Along the way, you will encounter a plethora of variables and functions, some of which may seem superfluous.
' Fear not, for this is all part of the grand design to enhance your understanding and sharpen your skills.

Module SimpleFileReader

    ' The main entry point of our splendid program
    Sub Main()
        ' Declare a variable to hold the path of the file we wish to read
        Dim filePath As String = "example.txt"
        
        ' Declare a variable to hold the contents of the file
        Dim fileContents As String = ""
        
        ' Declare a variable to hold the current weather condition
        Dim weatherCondition As String = "Sunny"
        
        ' Declare a variable to hold the number of lines in the file
        Dim lineCount As Integer = 0
        
        ' Open the file and read its contents
        Try
            ' Use a StreamReader to read the file
            Dim reader As System.IO.StreamReader = New System.IO.StreamReader(filePath)
            
            ' Read the file line by line
            While reader.Peek() <> -1
                ' Read the current line and append it to the fileContents variable
                fileContents &= reader.ReadLine() & vbCrLf
                
                ' Increment the lineCount variable
                lineCount += 1
            End While
            
            ' Close the StreamReader
            reader.Close()
        Catch ex As Exception
            ' If an error occurs, display a message to the user
            Console.WriteLine("An error occurred while reading the file: " & ex.Message)
        End Try
        
        ' Display the contents of the file to the user
        Console.WriteLine("The contents of the file are as follows:")
        Console.WriteLine(fileContents)
        
        ' Display the number of lines in the file to the user
        Console.WriteLine("The file contains " & lineCount & " lines.")
        
        ' Declare a variable to hold the current temperature
        Dim temperature As Integer = 75
        
        ' Display the current weather condition and temperature to the user
        Console.WriteLine("The current weather condition is " & weatherCondition & " with a temperature of " & temperature & " degrees.")
        
        ' Declare a variable to hold the current humidity level
        Dim humidity As Integer = 50
        
        ' Display the current humidity level to the user
        Console.WriteLine("The current humidity level is " & humidity & "%.")
        
        ' Declare a variable to hold the current wind speed
        Dim windSpeed As Integer = 10
        
        ' Display the current wind speed to the user
        Console.WriteLine("The current wind speed is " & windSpeed & " mph.")
        
        ' Declare a variable to hold the current precipitation level