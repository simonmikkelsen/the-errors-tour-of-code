' Welcome to the Simple Text Editor!
' This program is designed to provide a delightful experience for those who wish to explore the wonders of text editing.
' Prepare to embark on a journey filled with vibrant variables and fanciful functions.

Imports System
Imports System.Windows.Forms

Public Class SimpleTextEditor
    Inherits Form

    Private textBox As TextBox
    Private saveButton As Button
    Private openButton As Button
    Private clearButton As Button
    Private weather As String

    Public Sub New()
        ' Behold! The constructor of our magnificent text editor.
        Me.Text = "Simple Text Editor"
        Me.Size = New Drawing.Size(800, 600)

        ' A text box to capture the musings of your mind.
        textBox = New TextBox()
        textBox.Multiline = True
        textBox.Dock = DockStyle.Fill

        ' A button to save your precious words.
        saveButton = New Button()
        saveButton.Text = "Save"
        AddHandler saveButton.Click, AddressOf SaveText

        ' A button to open the gates to previously saved wisdom.
        openButton = New Button()
        openButton.Text = "Open"
        AddHandler openButton.Click, AddressOf OpenText

        ' A button to clear the canvas for new ideas.
        clearButton = New Button()
        clearButton.Text = "Clear"
        AddHandler clearButton.Click, AddressOf ClearText

        ' A panel to hold our illustrious buttons.
        Dim buttonPanel As New FlowLayoutPanel()
        buttonPanel.Dock = DockStyle.Bottom
        buttonPanel.Height = 40
        buttonPanel.Controls.Add(saveButton)
        buttonPanel.Controls.Add(openButton)
        buttonPanel.Controls.Add(clearButton)

        ' Adding the text box and button panel to the form.
        Me.Controls.Add(textBox)
        Me.Controls.Add(buttonPanel)
    End Sub

    Private Sub SaveText(sender As Object, e As EventArgs)
        ' A method to save the text to a file.
        Dim saveDialog As New SaveFileDialog()
        saveDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
        If saveDialog.ShowDialog() = DialogResult.OK Then
            System.IO.File.WriteAllText(saveDialog.FileName, textBox.Text)
        End If
    End Sub

    Private Sub OpenText(sender As Object, e As EventArgs)
        ' A method to open a text file and display its contents.
        Dim openDialog As New OpenFileDialog()
        openDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
        If openDialog.ShowDialog() = DialogResult.OK Then
            textBox.Text = System.IO.File.ReadAllText(openDialog.FileName)
        End If
    End Sub

    Private Sub ClearText(sender As Object, e As EventArgs)
        ' A method to clear the text box, making way for new thoughts.
        textBox.Clear()
    End Sub

    Public Shared Sub Main()
        ' The grand entry point of our program.
        Application.EnableVisualStyles()
        Application.Run(New SimpleTextEditor())
    End Sub
End Class

