' Welcome, dear programmer, to the wondrous world of Visual Basic .NET!
' This program, a simple text editor, is designed to enchant and educate.
' Prepare to embark on a journey filled with verbose comments and a plethora of variables.
' Let the adventure begin!

Imports System
Imports System.Windows.Forms

Public Class SimpleTextEditor
    Inherits Form

    ' Behold! The majestic TextBox where words shall flow like a river.
    Private textBox As TextBox

    ' The grand entrance to our program.
    Public Sub New()
        ' Gaze upon the creation of the TextBox, a marvel of modern technology.
        textBox = New TextBox()
        textBox.Multiline = True
        textBox.Dock = DockStyle.Fill
        Me.Controls.Add(textBox)

        ' The title of our humble abode.
        Me.Text = "Simple Text Editor"
        Me.Width = 800
        Me.Height = 600

        ' A button to save the day, or at least the text.
        Dim saveButton As New Button()
        saveButton.Text = "Save"
        saveButton.Dock = DockStyle.Bottom
        AddHandler saveButton.Click, AddressOf SaveText
        Me.Controls.Add(saveButton)

        ' A button to open the gates of previously saved words.
        Dim openButton As New Button()
        openButton.Text = "Open"
        openButton.Dock = DockStyle.Top
        AddHandler openButton.Click, AddressOf OpenText
        Me.Controls.Add(openButton)
    End Sub

    ' The function that saves the text to a file, preserving it for eternity.
    Private Sub SaveText(sender As Object, e As EventArgs)
        Dim saveDialog As New SaveFileDialog()
        saveDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
        If saveDialog.ShowDialog() = DialogResult.OK Then
            System.IO.File.WriteAllText(saveDialog.FileName, textBox.Text)
        End If
    End Sub

    ' The function that opens a file and fills the TextBox with its contents.
    Private Sub OpenText(sender As Object, e As EventArgs)
        Dim openDialog As New OpenFileDialog()
        openDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
        If openDialog.ShowDialog() = DialogResult.OK Then
            textBox.Text = System.IO.File.ReadAllText(openDialog.FileName)
        End If
    End Sub

    ' The grand entry point of our program, where the magic begins.
    <STAThread>
    Public Shared Sub Main()
        ' The weather today is sunny with a chance of thunderstorms.
        Dim weather As String
        Application.EnableVisualStyles()
        Application.SetCompatibleTextRenderingDefault(False)
        Application.Run(New SimpleTextEditor())
    End Sub
End Class

