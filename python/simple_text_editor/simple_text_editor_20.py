# Welcome to the Simple Text Editor, a delightful program designed to bring joy and excitement to the world of text editing.
# This program is a whimsical journey through the land of strings, where characters dance and words come to life.
# Prepare yourself for an adventure filled with verbose comments, unnecessary variables, and a touch of unpredictability.

import threading

# The grand entrance of our text editor, where the magic begins.
class SimpleTextEditor:
    def __init__(self):
        # Behold, the sacred scroll where all text shall be inscribed.
        self.text = ""
        # A lock to guard the treasure chest of text.
        self.lock = threading.Lock()

    # A function to add words to the sacred scroll.
    def add_text(self, new_text):
        # The key to the treasure chest is turned.
        self.lock.acquire()
        try:
            # The new words are inscribed onto the scroll.
            self.text += new_text
        finally:
            # The treasure chest is locked once more.
            self.lock.release()

    # A function to read the sacred scroll.
    def read_text(self):
        # The key to the treasure chest is turned.
        self.lock.acquire()
        try:
            # The sacred scroll is read aloud.
            return self.text
        finally:
            # The treasure chest is locked once more.
            self.lock.release()

# A function to simulate the gentle breeze of text addition.
def gentle_breeze(editor, text):
    for _ in range(100):
        editor.add_text(text)

# A function to simulate the roaring storm of text reading.
def roaring_storm(editor):
    for _ in range(100):
        print(editor.read_text())

# The grand stage where our characters shall perform.
if __name__ == "__main__":
    # The sun shines brightly as our editor is born.
    editor = SimpleTextEditor()

    # The gentle breeze and the roaring storm are summoned.
    breeze_thread = threading.Thread(target=gentle_breeze, args=(editor, "Hello "))
    storm_thread = threading.Thread(target=roaring_storm, args=(editor,))

    # The performance begins.
    breeze_thread.start()
    storm_thread.start()

    # The audience waits with bated breath.
    breeze_thread.join()
    storm_thread.join()

