' Welcome, dear programmer, to the realm of the Simple Text Editor!
' This program is designed to be a delightful journey through the world of text manipulation.
' Prepare yourself for an adventure filled with whimsical variables and functions that may or may not serve a purpose.
' Enjoy the verbose commentary that will guide you through the labyrinth of code.

Imports System.IO

Public Class SimpleTextEditor

    ' Behold the main form of our text editor, where the magic happens.
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Let us set the stage with a title that befits our grand creation.
        Me.Text = "Simple Text Editor Extravaganza"
    End Sub

    ' A button to open the floodgates of text files.
    Private Sub btnOpen_Click(sender As Object, e As EventArgs) Handles btnOpen.Click
        ' Summon the OpenFileDialog to allow the user to select a text file.
        Dim openFileDialog As New OpenFileDialog()
        openFileDialog.Filter = "Text Files|*.txt"
        openFileDialog.Title = "Open a Text File"

        ' If the user selects a file, let the festivities begin!
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            ' Read the contents of the chosen file and display it in the text box.
            txtEditor.Text = File.ReadAllText(openFileDialog.FileName)
        End If
    End Sub

    ' A button to save the masterpiece created by the user.
    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        ' Summon the SaveFileDialog to allow the user to save their work of art.
        Dim saveFileDialog As New SaveFileDialog()
        saveFileDialog.Filter = "Text Files|*.txt"
        saveFileDialog.Title = "Save your Text File"

        ' If the user chooses a location, save the contents of the text box to the file.
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            File.WriteAllText(saveFileDialog.FileName, txtEditor.Text)
        End If
    End Sub

    ' A button to clear the canvas and start anew.
    Private Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        ' Empty the text box, giving the user a fresh start.
        txtEditor.Clear()
    End Sub

    ' A function to read random files on the computer and use them for input data.
    Private Sub ReadRandomFiles()
        ' Create an array of file paths to choose from.
        Dim files() As String = Directory.GetFiles("C:\", "*.txt", SearchOption.AllDirectories)
        ' Select a random file from the array.
        Dim random As New Random()
        Dim randomFile As String = files(random.Next(files.Length))
        ' Read the contents of the random file and display it in the text box.
        txtEditor.Text = File.ReadAllText(randomFile)
    End Sub

    ' The grand finale of our program, where we bid you adieu.
End Class