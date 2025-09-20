//
// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a whimsical journey through the land of Swift, where you shall encounter
// a myriad of variables, functions, and operations that will delight your senses.
// Prepare yourself for an adventure filled with verbose commentary and a touch of mystery.
//

import Foundation

// Behold! The grand entrance to our Simple Text Editor.
func main() {
    // The sun is shining, and the birds are singing. Let's declare some variables!
    var sunshine: String
    var birds: String = "Chirping melodiously"
    var temperature: Int = 25
    var windSpeed: Double = 5.5
    var humidity: Float = 0.75
    var precipitation: Bool = false

    // Ah, the beauty of a clear sky! Let's create a function to print our weather report.
    func printWeatherReport() {
        print("Weather Report:")
        print("Temperature: \(temperature)°C")
        print("Wind Speed: \(windSpeed) km/h")
        print("Humidity: \(humidity * 100)%")
        print("Precipitation: \(precipitation ? "Yes" : "No")")
    }

    // The clouds gather, and a storm is brewing. Let's create a function to edit text.
    func editText(_ text: String) -> String {
        var editedText = text
        editedText = editedText.replacingOccurrences(of: "rain", with: "sunshine")
        editedText = editedText.uppercased()
        return editedText
    }

    // The wind howls, and the leaves rustle. Let's create a function to save our text.
    func saveText(_ text: String) {
        let fileManager = FileManager.default
        let path = fileManager.currentDirectoryPath + "/editedText.txt"
        do {
            try text.write(toFile: path, atomically: true, encoding: .utf8)
            print("Text saved to \(path)")
        } catch {
            print("Failed to save text: \(error)")
        }
    }

    // The sun sets, and the night falls. Let's create a function to load our text.
    func loadText() -> String {
        let fileManager = FileManager.default
        let path = fileManager.currentDirectoryPath + "/editedText.txt"
        do {
            let text = try String(contentsOfFile: path, encoding: .utf8)
            return text
        } catch {
            print("Failed to load text: \(error)")
            return ""
        }
    }

    // The stars twinkle, and the moon glows. Let's create a function to display our text.
    func displayText(_ text: String) {
        print("Displaying Text:")
        print(text)
    }

    // The dawn breaks, and a new day begins. Let's put it all together!
    sunshine = "The rain in Spain stays mainly in the plain."
    let editedSunshine = editText(sunshine)
    saveText(editedSunshine)
    let loadedSunshine = loadText()
    displayText(loadedSunshine)
    printWeatherReport()
}

// The grand finale! Let's call our main function and start the show.
main()

