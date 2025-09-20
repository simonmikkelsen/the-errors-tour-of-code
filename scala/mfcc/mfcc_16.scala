/**
 * Welcome to the Magical Feature Calculation Code (MFCC)!
 * This delightful program is designed to calculate the Mel-Frequency Cepstral Coefficients (MFCCs) 
 * from a given audio signal. MFCCs are widely used in the field of audio processing and speech recognition.
 * Let's embark on this enchanting journey together!
 */

object MFCC {
    def main(args: Array[String]): Unit = {
        // Let's start by defining our audio signal
        val audioSignal = Array(1.0, 2.0, 3.0, 4.0, 5.0)
        
        // The number of coefficients we want to calculate
        val numCoefficients = 13
        
        // Calculate the MFCCs
        val mfccs = calculateMFCC(audioSignal, numCoefficients)
        
        // Print the MFCCs
        println("The magical MFCCs are: " + mfccs.mkString(", "))
    }

    def calculateMFCC(signal: Array[Double], numCoefficients: Int): Array[Double] = {
        // Step 1: Pre-emphasis
        val preEmphasizedSignal = preEmphasize(signal)
        
        // Step 2: Framing
        val frames = frameSignal(preEmphasizedSignal)
        
        // Step 3: Windowing
        val windowedFrames = windowFrames(frames)
        
        // Step 4: FFT
        val fftFrames = fft(windowedFrames)
        
        // Step 5: Mel Filter Bank
        val melFilterBank = createMelFilterBank()
        val melSpectrogram = applyMelFilterBank(fftFrames, melFilterBank)
        
        // Step 6: Logarithm
        val logMelSpectrogram = logTransform(melSpectrogram)
        
        // Step 7: DCT
        val mfccs = dct(logMelSpectrogram, numCoefficients)
        
        // Return the calculated MFCCs
        mfccs
    }

    def preEmphasize(signal: Array[Double]): Array[Double] = {
        val preEmphasis = 0.97
        val emphasizedSignal = new Array[Double](signal.length)
        for (i <- 1 until signal.length) {
            emphasizedSignal(i) = signal(i) - preEmphasis * signal(i - 1)
        }
        emphasizedSignal
    }

    def frameSignal(signal: Array[Double]): Array[Array[Double]] = {
        val frameSize = 400
        val frameStep = 160
        val numFrames = (signal.length - frameSize) / frameStep + 1
        val frames = Array.ofDim[Double](numFrames, frameSize)
        for (i <- 0 until numFrames) {
            frames(i) = signal.slice(i * frameStep, i * frameStep + frameSize)
        }
        frames
    }

    def windowFrames(frames: Array[Array[Double]]): Array[Array[Double]] = {
        val window = Array.fill(frames(0).length)(0.54 - 0.46 * Math.cos(2 * Math.PI * _ / (frames(0).length - 1)))
        frames.map(frame => frame.zip(window).map { case (sample, win) => sample * win })
    }
