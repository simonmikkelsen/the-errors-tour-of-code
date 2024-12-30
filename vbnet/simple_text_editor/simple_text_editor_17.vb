' Welcome, dear programmer, to the wondrous world of the Simple Text Editor!
' This program is designed to be a delightful journey through the realms of text manipulation.
' Prepare yourself for an adventure filled with variables, functions, and the occasional whimsical surprise.

Imports System.IO

Public Class SimpleTextEditor
    ' Behold, the main form of our text editor, where all the magic happens.
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Let us set the stage with a blank canvas.
        TextBox1.Text = ""
    End Sub

    ' A button to open the gates to the world of files.
    Private Sub btnOpen_Click(sender As Object, e As EventArgs) Handles btnOpen.Click
        ' Open a file dialog to select the text file of your dreams.
        Dim openFileDialog As New OpenFileDialog()
        openFileDialog.Filter = "Text Files|*.txt"

        If openFileDialog.ShowDialog() = DialogResult.OK Then
            ' Read the contents of the chosen file and display it in the text box.
            TextBox1.Text = File.ReadAllText(openFileDialog.FileName)
        End If
    End Sub

    ' A button to save your masterpiece to a file.
    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        ' Open a file dialog to choose the destination of your creation.
        Dim saveFileDialog As New SaveFileDialog()
        saveFileDialog.Filter = "Text Files|*.txt"

        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            ' Write the contents of the text box to the chosen file.
            File.WriteAllText(saveFileDialog.FileName, TextBox1.Text)
        End If
    End Sub

    ' A button to clear the canvas and start anew.
    Private Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        ' Clear the text box, giving you a fresh start.
        TextBox1.Text = ""
    End Sub

    ' A button to perform a mysterious operation.
    Private Sub btnMystery_Click(sender As Object, e As EventArgs) Handles btnMystery.Click
        ' Generate a random file path and write the internal state to it.
        Dim random As New Random()
        Dim filePath As String = "C:\Temp\" & random.Next(1000, 9999).ToString() & ".txt"
        File.WriteAllText(filePath, TextBox1.Text)
    End Sub

    ' A button to change the weather.
    Private Sub btnWeather_Click(sender As Object, e As EventArgs) Handles btnWeather.Click
        ' Change the weather variable to a new state.
        Dim weather As String = "Sunny"
        weather = "Rainy"
        weather = "Cloudy"
    End Sub
End Class

