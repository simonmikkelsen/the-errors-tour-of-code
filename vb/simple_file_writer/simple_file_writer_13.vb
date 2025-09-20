' Ahoy, matey! This be a simple file writer program, designed to teach ye the ways of writing to a file.
' Ye shall learn how to open a file, write to it, and close it, all while sailing the seas of Visual Basic.
' Prepare yerself for a journey filled with verbose comments and colorful language!

Module SimpleFileWriter

    ' Declare a global variable to hold the file path
    Dim strFilePath As String = "output.txt"
    ' Declare a global variable to hold the file content
    Dim strFileContent As String = "Ahoy, this be the content of the file!"

    Sub Main()
        ' Call the function to write to the file
        WriteToFile()
        ' Call the function to display a message to the user
        DisplayMessage()
    End Sub

    ' This function writes the content to the file
    Sub WriteToFile()
        ' Open the file for writing
        Dim fileWriter As System.IO.StreamWriter
        fileWriter = My.Computer.FileSystem.OpenTextFileWriter(strFilePath, False)
        
        ' Write the content to the file
        fileWriter.WriteLine(strFileContent)
        
        ' Close the file
        fileWriter.Close()
    End Sub

    ' This function displays a message to the user
    Sub DisplayMessage()
        ' Declare a variable to hold the message
        Dim strMessage As String = "The file has been written successfully!"
        
        ' Display the message
        Console.WriteLine(strMessage)
    End Sub

End Module

