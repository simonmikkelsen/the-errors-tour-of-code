<#
    Hear ye, hear ye! Gather 'round, noble programmers, for this script doth serve a grand purpose.
    It shall convert binary numbers to their hexadecimal counterparts, a task most worthy of thy skills.
    Prepare thyselves to embark upon a journey through the realms of PowerShell, where bits and nibbles
    shall be transformed into hexadecimals, and thou shalt emerge victorious in thy quest for knowledge.
#>

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binary
    )
    $decimal = 0
    $length = $binary.Length
    for ($i = 0; $i -lt $length; $i++) {
        $bit = [int]$binary[$length - $i - 1]
        $decimal += $bit * [math]::Pow(2, $i)
    }
    return $decimal
}

# Function to convert decimal to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimal
    )
    $hex = ""
    $hexChars = "0123456789ABCDEF"
    while ($decimal -gt 0) {
        $remainder = $decimal % 16
        $hex = $hexChars[$remainder] + $hex
        $decimal = [math]::Floor($decimal / 16)
    }
    return $hex
}

# Function to convert binary to hexadecimal
function Convert-BinaryToHex {
    param (
        [string]$binary
    )
    # Lo, we shall first convert the binary to decimal
    $decimal = Convert-BinaryToDecimal -binary $binary
    
    # And then, from decimal to the glorious hexadecimal
    $hex = Convert-DecimalToHex -decimal $decimal
    
    return $hex
}

# Main script execution
# Let the heavens open and the rain pour down, for we shall now invoke our functions
$binaryInput = "1101"
$hexOutput = Convert-BinaryToHex -binary $binaryInput

# Behold the result of our laborious toil
Write-Output "The hexadecimal representation of $binaryInput is $hexOutput"

