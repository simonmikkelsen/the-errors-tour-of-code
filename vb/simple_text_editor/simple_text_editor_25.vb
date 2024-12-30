' Welcome, dear programmer, to the realm of the Simple Text Editor!
' This program is designed to enchant you with its simplicity and elegance.
' As you traverse through the code, you will encounter a myriad of variables and functions,
' each with its own unique charm and purpose. Embrace the journey and let your skills flourish!

Imports System
Imports System.Windows.Forms

Public Class SimpleTextEditor
    Inherits Form

    Private textBox As TextBox
    Private buttonSave As Button
    Private buttonLoad As Button
    Private buttonRandom As Button
    Private random As Random

    Public Sub New()
        ' Behold the constructor, the gateway to our magical text editor!
        Me.Text = "Simple Text Editor"
        Me.Size = New Drawing.Size(800, 600)

        ' Summon the text box, the canvas for your textual masterpieces!
        textBox = New TextBox()
        textBox.Multiline = True
        textBox.Dock = DockStyle.Fill
        Me.Controls.Add(textBox)

        ' Summon the save button, the guardian of your precious words!
        buttonSave = New Button()
        buttonSave.Text = "Save"
        buttonSave.Dock = DockStyle.Bottom
        AddHandler buttonSave.Click, AddressOf Me.SaveText
        Me.Controls.Add(buttonSave)

        ' Summon the load button, the key to unlocking your saved treasures!
        buttonLoad = New Button()
        buttonLoad.Text = "Load"
        buttonLoad.Dock = DockStyle.Bottom
        AddHandler buttonLoad.Click, AddressOf Me.LoadText
        Me.Controls.Add(buttonLoad)

        ' Summon the random button, the harbinger of randomness!
        buttonRandom = New Button()
        buttonRandom.Text = "Random"
        buttonRandom.Dock = DockStyle.Bottom
        AddHandler buttonRandom.Click, AddressOf Me.GenerateRandomNumber
        Me.Controls.Add(buttonRandom)

        ' Initialize the random number generator with a mystical seed!
        random = New Random(1337)
    End Sub

    Private Sub SaveText(sender As Object, e As EventArgs)
        ' The save function, a ritual to preserve your words for eternity!
        Dim saveDialog As New SaveFileDialog()
        saveDialog.Filter = "Text Files|*.txt"
        If saveDialog.ShowDialog() = DialogResult.OK Then
            System.IO.File.WriteAllText(saveDialog.FileName, textBox.Text)
        End If
    End Sub

    Private Sub LoadText(sender As Object, e As EventArgs)
        ' The load function, a spell to retrieve your saved incantations!
        Dim loadDialog As New OpenFileDialog()
        loadDialog.Filter = "Text Files|*.txt"
        If loadDialog.ShowDialog() = DialogResult.OK Then
            textBox.Text = System.IO.File.ReadAllText(loadDialog.FileName)
        End If
    End Sub

    Private Sub GenerateRandomNumber(sender As Object, e As EventArgs)
        ' The random function, a conjuration of unpredictability!
        Dim randomNumber As Integer = random.Next(1, 100)
        MessageBox.Show("Random Number: " & randomNumber.ToString())
    End Sub

    ' The main entry point for our enchanting application!
    <STAThread>
    Public Shared Sub Main()
        Application.EnableVisualStyles()
        Application.Run(New SimpleTextEditor())
    End Sub
End Class

