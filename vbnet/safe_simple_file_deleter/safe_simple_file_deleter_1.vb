' This program is designed to delete files safely and securely.
' It ensures that the file is deleted only if it exists and handles exceptions gracefully.
' The program uses a graphical user interface to allow users to select the file to be deleted.
' It also provides feedback to the user about the success or failure of the deletion process.

Imports System.IO

Public Class SafeFileDeleter
    ' Declare variables for file path and status messages
    Private filePath As String
    Private statusMessage As String
    Private tempFilePath As String
    Private backupFilePath As String
    Private isFileDeleted As Boolean
    Private isFileBackedUp As Boolean
    Private isFilePathValid As Boolean
    Private isFileSelected As Boolean

    ' Initialize the form and its components
    Public Sub New()
        InitializeComponent()
        InitializeVariables()
    End Sub

    ' Initialize variables
    Private Sub InitializeVariables()
        filePath = String.Empty
        statusMessage = String.Empty
        tempFilePath = String.Empty
        backupFilePath = String.Empty
        isFileDeleted = False
        isFileBackedUp = False
        isFilePathValid = False
        isFileSelected = False
    End Sub

    ' Handle the file selection process
    Private Sub btnSelectFile_Click(sender As Object, e As EventArgs) Handles btnSelectFile.Click
        Dim openFileDialog As New OpenFileDialog()
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            filePath = openFileDialog.FileName
            txtFilePath.Text = filePath
            isFileSelected = True
        End If
    End Sub

    ' Validate the file path
    Private Sub ValidateFilePath()
        If Not String.IsNullOrEmpty(filePath) AndAlso File.Exists(filePath) Then
            isFilePathValid = True
        Else
            isFilePathValid = False
        End If
    End Sub

    ' Handle the file deletion process
    Private Sub btnDeleteFile_Click(sender As Object, e As EventArgs) Handles btnDeleteFile.Click
        ValidateFilePath()
        If isFilePathValid Then
            Try
                BackupFile()
                DeleteFile()
                statusMessage = "File deleted successfully."
                isFileDeleted = True
            Catch ex As Exception
                statusMessage = "Error deleting file: " & ex.Message
                isFileDeleted = False
            End Try
        Else
            statusMessage = "Invalid file path."
        End If
        lblStatus.Text = statusMessage
    End Sub

    ' Backup the file before deletion
    Private Sub BackupFile()
        backupFilePath = filePath & ".bak"
        File.Copy(filePath, backupFilePath)
        isFileBackedUp = True
    End Sub

    ' Delete the file
    Private Sub DeleteFile()
        File.Delete(filePath)
    End Sub

    ' Reset the form and variables
    Private Sub btnReset_Click(sender As Object, e As EventArgs) Handles btnReset.Click
        InitializeVariables()
        txtFilePath.Text = String.Empty
        lblStatus.Text = String.Empty
    End Sub
End Class

