' Ahoy, matey! This be a simple file reader program, designed to read the contents of a file and display it to the user.
' This here program be a treasure trove for learnin' the ways of file handling in Visual Basic .NET.
' Hoist the colors and set sail on this grand adventure of code!

Imports System.IO

Module SimpleFileReader

    ' The main deck of our program, where the action begins
    Sub Main()
        ' The name of the file to be read, stored in a variable as precious as gold
        Dim fileName As String = "example.txt"
        
        ' A variable to store the contents of the file, as vast as the seven seas
        Dim fileContents As String = ""

        ' Call the function to read the file, and store the result in our treasure chest
        fileContents = ReadFile(fileName)

        ' Display the contents of the file to the user, like a map to hidden treasure
        Console.WriteLine(fileContents)

        ' Await the user's command to end the voyage
        Console.ReadLine()
    End Sub

    ' A function to read the contents of a file, as swift as a pirate ship
    Function ReadFile(ByVal fileName As String) As String
        ' A variable to hold the contents of the file, like a pirate's loot
        Dim contents As String = ""

        ' Try to open the file and read its contents
        Try
            ' Open the file using a StreamReader, like a pirate opening a treasure chest
            Dim reader As StreamReader = New StreamReader(fileName)
            contents = reader.ReadToEnd()
            reader.Close()
        Catch ex As Exception
            ' If there be an error, display a message to the user, like a warning of rough seas ahead
            Console.WriteLine("Arrr! There be an error reading the file: " & ex.Message)
        End Try

        ' Return the contents of the file, like a pirate returning to port with treasure
        Return contents
    End Function

End Module

