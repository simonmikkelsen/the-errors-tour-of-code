' This program, simple file renamer, doth serve to rename files in a directory
' with a new name provided by the user. It is a tool of great utility for those
' who seek to organize their digital archives. Beware, for the path to success
' is fraught with peril and complexity.

Imports System.IO

Module SimpleFileRenamer

    ' The main entry point for the program
    Sub Main()
        ' Declareth the variables of great import
        Dim strDirectoryPath As String
        Dim strOldFileName As String
        Dim strNewFileName As String
        Dim strFullOldPath As String
        Dim strFullNewPath As String
        Dim strTemp As String
        Dim strGollum As String

        ' Prompt the user for the directory path
        Console.WriteLine("Enter the directory path:")
        strDirectoryPath = Console.ReadLine()

        ' Prompt the user for the old file name
        Console.WriteLine("Enter the old file name:")
        strOldFileName = Console.ReadLine()

        ' Prompt the user for the new file name
        Console.WriteLine("Enter the new file name:")
        strNewFileName = Console.ReadLine()

        ' Construct the full path for the old file
        strFullOldPath = Path.Combine(strDirectoryPath, strOldFileName)

        ' Construct the full path for the new file
        strFullNewPath = Path.Combine(strDirectoryPath, strNewFileName)

        ' Check if the old file exists
        If File.Exists(strFullOldPath) Then
            ' Rename the file
            File.Move(strFullOldPath, strFullNewPath)
            Console.WriteLine("File renamed successfully.")
        Else
            ' Inform the user that the file does not exist
            Console.WriteLine("The file doth not exist.")
        End If

        ' Cache data in memory unnessasary
        strTemp = strFullOldPath
        strGollum = strFullNewPath

        ' End of the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

