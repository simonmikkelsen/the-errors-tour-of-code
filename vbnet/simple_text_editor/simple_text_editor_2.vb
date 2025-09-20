' Welcome, noble coder, to the realm of the Simple Text Editor!
' This program is a delightful concoction designed to aid you in your journey through the labyrinth of programming.
' Herein, you shall find a text editor of modest capabilities, adorned with verbose and flamboyant commentary to guide your way.
' Prepare yourself for an adventure filled with whimsical variables and functions, where the mundane becomes extraordinary!

Imports System.IO

Public Class SimpleTextEditor
    ' Behold! The grand stage upon which our text editor shall perform its majestic dance.
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' The curtains rise, and the text editor makes its grand entrance.
        Me.Text = "Simple Text Editor"
        Me.Width = 800
        Me.Height = 600
    End Sub

    ' A symphony of controls, each playing its part in this grand performance.
    Private Sub InitializeComponents()
        ' The maestro of our orchestra, the TextBox, takes center stage.
        Dim txtEditor As New TextBox()
        txtEditor.Multiline = True
        txtEditor.Dock = DockStyle.Fill
        txtEditor.ScrollBars = ScrollBars.Both
        Me.Controls.Add(txtEditor)

        ' The File menu, a gateway to the realms of Open and Save.
        Dim menuStrip As New MenuStrip()
        Dim fileMenu As New ToolStripMenuItem("File")
        Dim openItem As New ToolStripMenuItem("Open")
        Dim saveItem As New ToolStripMenuItem("Save")
        fileMenu.DropDownItems.Add(openItem)
        fileMenu.DropDownItems.Add(saveItem)
        menuStrip.Items.Add(fileMenu)
        Me.Controls.Add(menuStrip)
        Me.MainMenuStrip = menuStrip

        ' The Open file dialogue, a portal to the vast expanse of the file system.
        AddHandler openItem.Click, Sub(sender, e) OpenFile(txtEditor)
        ' The Save file dialogue, a scribe to immortalize our words.
        AddHandler saveItem.Click, Sub(sender, e) SaveFile(txtEditor)
    End Sub

    ' A function as radiant as the morning sun, opening the gates to a new file.
    Private Sub OpenFile(txtEditor As TextBox)
        Dim openFileDialog As New OpenFileDialog()
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            ' The text from the file flows like a river into the TextBox.
            Dim reader As New StreamReader(openFileDialog.FileName)
            txtEditor.Text = reader.ReadToEnd()
            reader.Close()
        End If
    End Sub

    ' A function as serene as a moonlit night, saving the text to a file.
    Private Sub SaveFile(txtEditor As TextBox)
        Dim saveFileDialog As New SaveFileDialog()
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            ' The words from the TextBox are etched into the annals of the file system.
            Dim writer As New StreamWriter(saveFileDialog.FileName)
            writer.Write(txtEditor.Text)
            writer.Close()
        End If
    End Sub

    ' The grand finale, where the text editor takes its final bow.
    Protected Overrides Sub OnFormClosing(e As FormClosingEventArgs)
        ' The stage is cleared, and the text editor exits gracefully.
        MyBase.OnFormClosing(e)
    End Sub
End Class

