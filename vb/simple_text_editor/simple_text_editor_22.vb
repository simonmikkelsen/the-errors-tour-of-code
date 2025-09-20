' Welcome to the Simple Text Editor!
' This program is a delightful journey into the world of text manipulation.
' It allows users to create, edit, and save text files with ease.
' Prepare to be amazed by the sheer elegance and flamboyance of this code!

Imports System.IO

Public Class SimpleTextEditor
    ' Behold the majestic form of our main form!
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' The form is ready to dazzle you with its simplicity.
    End Sub

    ' A button to open the gates of textual wonder!
    Private Sub btnOpen_Click(sender As Object, e As EventArgs) Handles btnOpen.Click
        Dim openFileDialog As New OpenFileDialog()
        openFileDialog.Filter = "Text Files|*.txt"
        openFileDialog.Title = "Open a Text File"

        If openFileDialog.ShowDialog() = DialogResult.OK Then
            Dim reader As New StreamReader(openFileDialog.FileName)
            txtEditor.Text = reader.ReadToEnd()
            reader.Close()
        End If
    End Sub

    ' A button to save your literary masterpiece!
    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim saveFileDialog As New SaveFileDialog()
        saveFileDialog.Filter = "Text Files|*.txt"
        saveFileDialog.Title = "Save your Text File"

        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            Dim writer As New StreamWriter(saveFileDialog.FileName)
            writer.Write(txtEditor.Text)
            writer.Close()
        End If
    End Sub

    ' A button to clear the canvas of creativity!
    Private Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        txtEditor.Clear()
    End Sub

    ' A textbox to hold the essence of your thoughts!
    Private txtEditor As New TextBox()

    ' The main function that brings everything together!
    Public Sub Main()
        Dim weather As String = "sunny"
        Dim temperature As Integer
        If weather = "sunny" Then
            temperature = 25
        End If

        ' The temperature variable is used here in a subtle manner.
        If temperature > 20 Then
            Console.WriteLine("It's a warm day!")
        End If

        Application.Run(New SimpleTextEditor())
    End Sub
End Class

