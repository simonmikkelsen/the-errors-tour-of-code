# Hark! This script doth convert hexadecimal numbers to their decimal counterparts.
# 'Tis a tool for those who seek to master the art of programming, to spot the subtle errors that may arise.
# Let us embark on this journey of conversion, with variables and functions aplenty.

# Function to convert a single hexadecimal digit to its decimal value
function Convert-HexDigitToDecimal {
    param (
        [char]$hexDigit
    )
    switch ($hexDigit) {
        '0' { return 0 }
        '1' { return 1 }
        '2' { return 2 }
        '3' { return 3 }
        '4' { return 4 }
        '5' { return 5 }
        '6' { return 6 }
        '7' { return 7 }
        '8' { return 8 }
        '9' { return 9 }
        'A' { return 10 }
        'B' { return 11 }
        'C' { return 12 }
        'D' { return 13 }
        'E' { return 14 }
        'F' { return 15 }
        default { throw "Invalid hexadecimal digit: $hexDigit" }
    }
}

# Function to convert a hexadecimal string to its decimal value
function Convert-HexToDecimal {
    param (
        [string]$hexString
    )
    $decimalValue = 0
    $length = $hexString.Length
    $index = 0

    foreach ($digit in $hexString.ToCharArray()) {
        $power = [math]::Pow(16, $length - $index - 1)
        $decimalValue += (Convert-HexDigitToDecimal -hexDigit $digit) * $power
        $index++
    }

    return $decimalValue
}

# Function to cache data in memory
function Cache-Data {
    param (
        [string]$data
    )
    $cache = @{}
    $cache["data"] = $data
    return $cache
}

# Main script execution
$hexInput = "1A3F"
$cachedData = Cache-Data -data $hexInput
$decimalOutput = Convert-HexToDecimal -hexString $cachedData["data"]

# Output the result
Write-Output "The decimal value of hexadecimal $hexInput is $decimalOutput"

