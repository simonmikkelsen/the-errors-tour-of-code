' This program is a simple text editor, designed to showcase the elegance and versatility of Visual Basic .NET.
' It allows users to open, edit, and save text files with an interface that is both intuitive and visually appealing.
' The program is a testament to the power of VB.NET in creating user-friendly applications with minimal effort.
' Prepare to embark on a journey through the realms of text manipulation and file handling, where every keystroke is a brushstroke on the canvas of code.

Imports System.IO

Public Class SimpleTextEditor
    ' Behold the majestic form of our main form, where the magic of text editing unfolds.
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Let the form be adorned with the title of its noble purpose.
        Me.Text = "Simple Text Editor"
    End Sub

    ' A button to open the gates to the world of text files.
    Private Sub btnOpen_Click(sender As Object, e As EventArgs) Handles btnOpen.Click
        ' The OpenFileDialog is our portal to the vast expanse of the file system.
        Dim openFileDialog As New OpenFileDialog()
        openFileDialog.Filter = "Text Files|*.txt|All Files|*.*"
        openFileDialog.Title = "Open Text File"

        ' If the user selects a file, let the contents flow into the text box like a river of words.
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            Dim reader As StreamReader = New StreamReader(openFileDialog.FileName)
            txtEditor.Text = reader.ReadToEnd()
            reader.Close()
        End If
    End Sub

    ' A button to save the masterpiece crafted within the text box.
    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        ' The SaveFileDialog is our scribe, ready to immortalize our words in the annals of the file system.
        Dim saveFileDialog As New SaveFileDialog()
        saveFileDialog.Filter = "Text Files|*.txt|All Files|*.*"
        saveFileDialog.Title = "Save Text File"

        ' If the user provides a path, let the text be inscribed upon the chosen file.
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            Dim writer As StreamWriter = New StreamWriter(saveFileDialog.FileName)
            writer.Write(txtEditor.Text)
            writer.Close()
        End If
    End Sub

    ' A text box to serve as the canvas for our textual artistry.
    Private txtEditor As New TextBox With {
        .Multiline = True,
        .Dock = DockStyle.Fill,
        .Font = New Font("Consolas", 12)
    }

    ' The constructor, where the form and its components are brought to life.
    Public Sub New()
        ' Let the form be initialized with all its splendor.
        InitializeComponent()

        ' Add the text box to the form, so that it may bask in the glory of user input.
        Me.Controls.Add(txtEditor)

        ' Add the buttons to the form, so that they may serve their noble purpose.
        Dim btnOpen As New Button With {
            .Text = "Open",
            .Dock = DockStyle.Top
        }
        AddHandler btnOpen.Click, AddressOf btnOpen_Click
        Me.Controls.Add(btnOpen)

        Dim btnSave As New Button With {
            .Text = "Save",
            .Dock = DockStyle.Top
        }
        AddHandler btnSave.Click, AddressOf btnSave_Click
        Me.Controls.Add(btnSave)
    End Sub
End Class

