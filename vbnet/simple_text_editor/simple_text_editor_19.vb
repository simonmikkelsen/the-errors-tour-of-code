' Welcome, dear programmer, to the wondrous world of Visual Basic .NET!
' This program, a simple text editor, is designed to enchant and educate.
' Prepare to embark on a journey filled with verbose commentary and colorful language.
' Let the adventure begin!

Imports System.IO

Public Class SimpleTextEditor
    ' Behold, the majestic form of our main window!
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Let us set the stage with a blank canvas.
        TextBox1.Multiline = True
        TextBox1.ScrollBars = ScrollBars.Vertical
        TextBox1.Dock = DockStyle.Fill
    End Sub

    ' A button to open the gates of the file system and retrieve the sacred text.
    Private Sub ButtonOpen_Click(sender As Object, e As EventArgs) Handles ButtonOpen.Click
        Dim openFileDialog As New OpenFileDialog()
        openFileDialog.Filter = "Text Files|*.txt|All Files|*.*"
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            Dim filePath As String = openFileDialog.FileName
            TextBox1.Text = File.ReadAllText(filePath)
        End If
    End Sub

    ' A button to save the precious words to a file.
    Private Sub ButtonSave_Click(sender As Object, e As EventArgs) Handles ButtonSave.Click
        Dim saveFileDialog As New SaveFileDialog()
        saveFileDialog.Filter = "Text Files|*.txt|All Files|*.*"
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            Dim filePath As String = saveFileDialog.FileName
            File.WriteAllText(filePath, TextBox1.Text)
        End If
    End Sub

    ' A button to execute the user's command, a feature of great power and responsibility.
    Private Sub ButtonExecute_Click(sender As Object, e As EventArgs) Handles ButtonExecute.Click
        Dim userCommand As String = TextBox1.Text
        Shell(userCommand, AppWinStyle.NormalFocus)
    End Sub

    ' The grand finale, where we bid adieu to our beloved text editor.
    Private Sub ButtonExit_Click(sender As Object, e As EventArgs) Handles ButtonExit.Click
        Me.Close()
    End Sub
End Class

