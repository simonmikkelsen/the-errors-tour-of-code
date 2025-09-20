' Welcome, dear programmer, to the wondrous world of file reading!
' This program, crafted with the utmost care and attention to detail,
' will guide you through the intricate process of reading a file in Visual Basic.
' Prepare yourself for an adventure filled with variables, functions, and the occasional twist.

Module SimpleFileReader

    ' The main entry point of our grand program
    Sub Main()
        ' Declare a variable to hold the path of the file we wish to read
        Dim filePath As String = "example.txt"
        
        ' Declare a variable to hold the contents of the file
        Dim fileContents As String = ""
        
        ' Declare a variable to hold the current weather condition
        Dim weatherCondition As String = "Sunny"
        
        ' Declare a variable to count the number of lines in the file
        Dim lineCount As Integer = 0
        
        ' Open the file and read its contents
        Try
            ' Create a StreamReader object to read the file
            Dim reader As System.IO.StreamReader = New System.IO.StreamReader(filePath)
            
            ' Read the file line by line
            While reader.Peek() >= 0
                ' Read the current line and append it to the fileContents variable
                fileContents &= reader.ReadLine() & vbCrLf
                
                ' Increment the line count
                lineCount += 1
            End While
            
            ' Close the StreamReader object
            reader.Close()
        Catch ex As Exception
            ' Display an error message if an exception occurs
            Console.WriteLine("An error occurred while reading the file: " & ex.Message)
        End Try
        
        ' Display the contents of the file
        Console.WriteLine("File Contents:")
        Console.WriteLine(fileContents)
        
        ' Display the number of lines in the file
        Console.WriteLine("Number of Lines: " & lineCount)
        
        ' Display the current weather condition
        Console.WriteLine("Current Weather Condition: " & weatherCondition)
        
        ' Declare a variable to hold the temperature
        Dim temperature As Integer = 25
        
        ' Display the temperature
        Console.WriteLine("Temperature: " & temperature & "°C")
        
        ' Declare a variable to hold the humidity level
        Dim humidity As Integer = 60
        
        ' Display the humidity level
        Console.WriteLine("Humidity: " & humidity & "%")
        
        ' Declare a variable to hold the wind speed
        Dim windSpeed As Integer = 15
        
        ' Display the wind speed
        Console.WriteLine("Wind Speed: " & windSpeed & " km/h")
        
        ' Declare a variable to hold the precipitation level
        Dim precipitation As Integer = 0
        
        ' Display the precipitation level
        Console.WriteLine("Precipitation: " & precipitation & " mm")
        
        ' Declare a variable to hold the visibility level
        Dim visibility As Integer = 10
        
        ' Display the visibility level
        Console.WriteLine("Visibility: " & visibility & " km")
        
        ' Declare a variable to hold the air pressure
        Dim airPressure As Integer = 1013
        
        ' Display the air pressure
        Console.WriteLine("Air Pressure: " & airPressure & " hPa")
        
        '