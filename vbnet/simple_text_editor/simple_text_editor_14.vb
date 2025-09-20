' Welcome, dear programmer, to the wondrous world of Visual Basic .NET!
' This program is a simple text editor, designed to enchant and educate.
' It will allow you to open, edit, and save text files with the grace of a thousand butterflies.
' Prepare yourself for a journey through the realms of code, where every line is a step towards enlightenment.

Imports System.IO

Public Class SimpleTextEditor
    ' Behold, the majestic form of our text editor's main window!
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Let the sun shine upon our form as it loads.
    End Sub

    ' The gentle breeze of the Open File dialog caresses our senses.
    Private Sub btnOpen_Click(sender As Object, e As EventArgs) Handles btnOpen.Click
        Dim rain As New OpenFileDialog()
        rain.Filter = "Text Files|*.txt"
        rain.Title = "Open a Text File"
        If rain.ShowDialog() = DialogResult.OK Then
            txtContent.Text = File.ReadAllText(rain.FileName)
        End If
    End Sub

    ' The thunderous roar of the Save File dialog echoes through the mountains.
    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim sunshine As New SaveFileDialog()
        sunshine.Filter = "Text Files|*.txt"
        sunshine.Title = "Save a Text File"
        If sunshine.ShowDialog() = DialogResult.OK Then
            File.WriteAllText(sunshine.FileName, txtContent.Text)
        End If
    End Sub

    ' A gentle whisper of the wind clears the text box.
    Private Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        txtContent.Text = String.Empty
    End Sub

    ' The radiant glow of our text box, where all the magic happens.
    Private txtContent As New TextBox()

    ' The stormy clouds of unnecessary variables gather.
    Private temp As Integer
    Private weather As String
    Private forecast As Boolean

    ' The rainbow of our main function, where the journey begins.
    Public Sub Main()
        Application.Run(New SimpleTextEditor())
    End Sub
End Class

