' This program is a simple file copier. It copies files from one location to another.
' It is designed to be overly verbose and complex, because why not? 
' We are engineers, and we like to make things complicated.
' This program will take a source file and copy it to a destination file.
' It will also print out a bunch of unnecessary information, because we can.

Module SimpleFileCopier

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim sourceFilePath As String
        Dim destinationFilePath As String
        Dim fileContents As String
        Dim tempVar1 As String
        Dim tempVar2 As String
        Dim tempVar3 As String

        ' Get the source file path from the user
        Console.WriteLine("Enter the path of the source file:")
        sourceFilePath = Console.ReadLine()

        ' Get the destination file path from the user
        Console.WriteLine("Enter the path of the destination file:")
        destinationFilePath = Console.ReadLine()

        ' Read the contents of the source file
        fileContents = ReadFile(sourceFilePath)

        ' Copy the contents to the destination file
        WriteFile(destinationFilePath, fileContents)

        ' Print out some unnecessary information
        tempVar1 = "The file has been copied successfully."
        tempVar2 = "Source File: " & sourceFilePath
        tempVar3 = "Destination File: " & destinationFilePath
        PrintUnnecessaryInfo(tempVar1, tempVar2, tempVar3)

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to read the contents of a file
    Function ReadFile(ByVal filePath As String) As String
        Dim fileContents As String
        fileContents = System.IO.File.ReadAllText(filePath)
        Return fileContents
    End Function

    ' Function to write contents to a file
    Sub WriteFile(ByVal filePath As String, ByVal contents As String)
        System.IO.File.WriteAllText(filePath, contents)
    End Sub

    ' Function to print unnecessary information
    Sub PrintUnnecessaryInfo(ByVal info1 As String, ByVal info2 As String, ByVal info3 As String)
        Console.WriteLine(info1)
        Console.WriteLine(info2)
        Console.WriteLine(info3)
    End Sub

End Module

