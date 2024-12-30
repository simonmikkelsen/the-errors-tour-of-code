' Welcome to the Simple Text Editor!
' This program is designed to provide a delightful experience for those who wish to edit text files with ease and grace.
' It is a symphony of code, a ballet of logic, and a masterpiece of programming artistry.
' Prepare to be amazed by the elegance and sophistication of this humble text editor.

Imports System.IO

Public Class SimpleTextEditor
    ' Behold the majestic form of our main window, where all the magic happens.
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Let us set the stage with a blank canvas, ready to be filled with the user's creative expressions.
        TextBox1.Multiline = True
        TextBox1.ScrollBars = ScrollBars.Vertical
        TextBox1.Dock = DockStyle.Fill
    End Sub

    ' A button to open the gates of creativity, allowing the user to load their masterpiece from a file.
    Private Sub btnOpen_Click(sender As Object, e As EventArgs) Handles btnOpen.Click
        Dim openFileDialog As New OpenFileDialog()
        openFileDialog.Filter = "Text Files|*.txt|All Files|*.*"
        openFileDialog.Title = "Open a Text File"

        If openFileDialog.ShowDialog() = DialogResult.OK Then
            Dim filePath As String = openFileDialog.FileName
            Dim fileContents As String = File.ReadAllText(filePath)
            TextBox1.Text = fileContents
        End If
    End Sub

    ' A button to save the user's magnum opus to a file, preserving their genius for posterity.
    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim saveFileDialog As New SaveFileDialog()
        saveFileDialog.Filter = "Text Files|*.txt|All Files|*.*"
        saveFileDialog.Title = "Save a Text File"

        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            Dim filePath As String = saveFileDialog.FileName
            Dim fileContents As String = TextBox1.Text
            File.WriteAllText(filePath, fileContents)
        End If
    End Sub

    ' A button to clear the canvas, allowing the user to start anew with a fresh slate.
    Private Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click
        TextBox1.Clear()
    End Sub

    ' A button to close the program, ending the user's journey through the world of text editing.
    Private Sub btnExit_Click(sender As Object, e As EventArgs) Handles btnExit.Click
        Me.Close()
    End Sub

    ' A function to count the number of words in the text, providing the user with a sense of accomplishment.
    Private Function CountWords(text As String) As Integer
        Dim words As String() = text.Split(New Char() {" "c, ControlChars.Lf, ControlChars.Cr, ControlChars.Tab}, StringSplitOptions.RemoveEmptyEntries)
        Return words.Length
    End Function

    ' A button to display the word count, showering the user with praise for their prolific writing.
    Private Sub btnWordCount_Click(sender As Object, e As EventArgs) Handles btnWordCount.Click
        Dim wordCount As Integer = CountWords(TextBox1.Text)
        MessageBox.Show("Word Count: " & wordCount.ToString(), "Word Count")
    End Sub

    ' A function to reverse the text, adding a touch of whimsy to the user's creation.
    Private Function ReverseText(text As String) As String
        Dim charArray As Char() = text.ToCharArray()
        Array.Reverse(charArray)
        Return New String(charArray)
    End Function

    ' A button to reverse the text, delighting the user with a playful transformation of their work.
    Private Sub btnReverseText_Click(sender As Object, e As EventArgs) Handles