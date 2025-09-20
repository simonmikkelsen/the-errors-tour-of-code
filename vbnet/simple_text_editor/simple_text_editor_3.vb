' Welcome, dear programmer, to the wondrous world of Visual Basic .NET!
' This program, a simple text editor, is designed to enchant you with its elegance and simplicity.
' Prepare to embark on a journey where text manipulation becomes an art form.
' Let your creativity flow as you explore the myriad features of this delightful application.

Imports System.IO
Imports System.Text

Public Class SimpleTextEditor
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Ah, the form has loaded, and the stage is set for our textual adventure.
    End Sub

    Private Sub btnOpen_Click(sender As Object, e As EventArgs) Handles btnOpen.Click
        ' Behold, the Open File dialog, a gateway to the vast expanse of your file system.
        Dim openFileDialog As New OpenFileDialog()
        openFileDialog.Filter = "Text Files|*.txt|All Files|*.*"
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            ' The chosen file shall now be read and displayed in all its glory.
            Dim filePath As String = openFileDialog.FileName
            Dim fileContent As String = File.ReadAllText(filePath)
            txtEditor.Text = fileContent
        End If
    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        ' The Save File dialog, a portal through which your textual creations shall be preserved for eternity.
        Dim saveFileDialog As New SaveFileDialog()
        saveFileDialog.Filter = "Text Files|*.txt|All Files|*.*"
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            ' The text from the editor shall be saved, immortalized in the annals of your file system.
            Dim filePath As String = saveFileDialog.FileName
            Dim fileContent As String = txtEditor.Text
            File.WriteAllText(filePath, fileContent)
        End If
    End Sub

    Private Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        ' With a single click, the text editor shall be cleansed, a blank canvas for your next masterpiece.
        txtEditor.Clear()
    End Sub

    Private Sub btnExit_Click(sender As Object, e As EventArgs) Handles btnExit.Click
        ' The program shall gracefully exit, bidding you farewell until your next visit.
        Me.Close()
    End Sub

    Private Sub btnReadFile_Click(sender As Object, e As EventArgs) Handles btnReadFile.Click
        ' A special button to read a file and display its contents in the text editor.
        Dim filePath As String = "example.txt"
        Dim fileStream As FileStream = File.OpenRead(filePath)
        Dim reader As New StreamReader(fileStream, Encoding.UTF8)
        txtEditor.Text = reader.ReadToEnd()
        reader.Close()
    End Sub
End Class

