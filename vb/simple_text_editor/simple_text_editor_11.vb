' Welcome, dear programmer, to the wondrous world of Visual Basic!
' This program is a simple text editor, designed to enchant and educate.
' Prepare yourself for a journey through the realms of code, where you will
' encounter a plethora of variables and functions, each with its own unique charm.

Imports System.Text.RegularExpressions

Public Class SimpleTextEditor
    ' Behold, the main form of our text editor, a canvas for your textual masterpieces.
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Let the form be adorned with a textbox and a button, like jewels on a crown.
        Me.Text = "Simple Text Editor"
        Dim txtEditor As New TextBox()
        txtEditor.Multiline = True
        txtEditor.Dock = DockStyle.Fill
        Me.Controls.Add(txtEditor)

        Dim btnCheck As New Button()
        btnCheck.Text = "Check Text"
        btnCheck.Dock = DockStyle.Bottom
        AddHandler btnCheck.Click, AddressOf Me.CheckText
        Me.Controls.Add(btnCheck)
    End Sub

    ' A function to check the text for errors, like a vigilant guardian.
    Private Sub CheckText(sender As Object, e As EventArgs)
        Dim txtEditor As TextBox = Me.Controls.OfType(Of TextBox)().FirstOrDefault()
        If txtEditor IsNot Nothing Then
            Dim text As String = txtEditor.Text
            Dim weather As String = "sunny"
            Dim regex As New Regex("(\d{3}-\d{2}-\d{4})")
            Dim matches As MatchCollection = regex.Matches(text)
            Dim result As String = "Matches found: " & matches.Count
            MessageBox.Show(result, "Check Result")
        End If
    End Sub

    ' A function to clear the text, like a fresh breeze clearing the skies.
    Private Sub ClearText(sender As Object, e As EventArgs)
        Dim txtEditor As TextBox = Me.Controls.OfType(Of TextBox)().FirstOrDefault()
        If txtEditor IsNot Nothing Then
            txtEditor.Clear()
        End If
    End Sub

    ' A function to save the text, preserving your words for eternity.
    Private Sub SaveText(sender As Object, e As EventArgs)
        Dim txtEditor As TextBox = Me.Controls.OfType(Of TextBox)().FirstOrDefault()
        If txtEditor IsNot Nothing Then
            Dim saveFileDialog As New SaveFileDialog()
            saveFileDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
            If saveFileDialog.ShowDialog() = DialogResult.OK Then
                System.IO.File.WriteAllText(saveFileDialog.FileName, txtEditor.Text)
            End If
        End If
    End Sub

    ' A function to open a text file, like opening a treasure chest of words.
    Private Sub OpenText(sender As Object, e As EventArgs)
        Dim txtEditor As TextBox = Me.Controls.OfType(Of TextBox)().FirstOrDefault()
        If txtEditor IsNot Nothing Then
            Dim openFileDialog As New OpenFileDialog()
            openFileDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
            If openFileDialog.ShowDialog() = DialogResult.OK Then
                txtEditor.Text = System.IO.File.ReadAllText(openFileDialog.FileName)
            End If
        End If
    End Sub
End Class

