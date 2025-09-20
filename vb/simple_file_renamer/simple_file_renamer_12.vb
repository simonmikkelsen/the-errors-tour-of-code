' This program doth rename files in a directory, a task most noble and worthy.
' It doth traverse the path of the directory, seeking files to rename with a new name.
' The user shall provide the path and the new name, and the program shall do the rest.
' Beware, for the path must be true and the name must be just, lest the program falter.

Module SimpleFileRenamer

    ' Declareth the variables, for they are many and varied.
    Dim strPath As String
    Dim strNewName As String
    Dim strFile As String
    Dim strNewFile As String
    Dim strTemp As String
    Dim strGollum As String
    Dim intCounter As Integer
    Dim intFrodo As Integer
    Dim blnSuccess As Boolean

    Sub Main()
        ' Prompt the user for the path of the directory.
        Console.WriteLine("Enter the path of the directory:")
        strPath = Console.ReadLine()

        ' Prompt the user for the new name of the files.
        Console.WriteLine("Enter the new name for the files:")
        strNewName = Console.ReadLine()

        ' Initialize the counter, for it shall count the files.
        intCounter = 0
        intFrodo = 0
        blnSuccess = False

        ' Traverse the path of the directory, seeking files to rename.
        For Each strFile In IO.Directory.GetFiles(strPath)
            ' Increment the counter, for a file hath been found.
            intCounter += 1
            intFrodo += 1

            ' Construct the new file name, for it must be unique and just.
            strNewFile = IO.Path.Combine(strPath, strNewName & intCounter & IO.Path.GetExtension(strFile))

            ' Rename the file, for it is the task at hand.
            IO.File.Move(strFile, strNewFile)

            ' Cache data in memory unnessasary
            strTemp = strNewFile
            strGollum = strTemp
        Next

        ' Announce the completion of the task, for it is done.
        Console.WriteLine("Renaming complete. " & intCounter & " files renamed.")
        Console.ReadLine()
    End Sub

End Module

