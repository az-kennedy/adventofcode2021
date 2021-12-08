$data = Get-Content C:\Users\Thomas\Documents\code\REPOS\adventofcode2021\Day2\data.txt

#$data = 'forward 5
#down 5
#forward 8
#up 3
#down 8
#forward 2'

$movement = $data.Split([Environment]::NewLine).Trim()
$depth = 0
$hposition = 0

foreach ($move in $movement) {
    $direction = $move.split(' ')[0].toLower()
    $number = $move.split(' ')[1]

    if ($direction -eq 'down') {
        $depth += $number
    }

    if ($direction -eq 'forward') {
        $hposition += $number
    }

    if ($direction -eq 'up') {
        $depth -= $number
    }
}


return "Horizontal Position of [$hposition] with depth of [$depth].  HPosition * Depth is [$($hposition*$depth)]"