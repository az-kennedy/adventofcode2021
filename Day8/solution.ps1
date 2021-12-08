#$data = Get-Content C:\Users\Thomas\Documents\code\REPOS\adventofcode2021\Day8\data.txt

$data = 'be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce'

#length coding
$one = 2
$four = 4
$seven = 3
$eight = 7

#pattern coding
$two = 'gcdfa'
$three = 'fbcad'
$five = 'cdfbe'
$six = 'cdfgeb'
$nine = 'cefabd'
$zero = 'cagedb'

$sum = 0

$readings = $data.Split([Environment]::NewLine)


foreach ($reading in $readings) {
    if ($reading -eq '') {
        continue
    }
    #$input = $reading.Split('|')[0]
    $output = $reading.Split('|')[1]
    try{$output = $output.Trim()}catch{}

    $oneRead = $output.Split(' ')
    $readingOutput = ''

    foreach ($item in $oneRead) {
        $length = $item.Length

        if ($length -eq $one) {
            $readingOutput += '1'
        }
        if ($item -contains 'g' -and $length -eq 5) {
            $readingOutput += '2'
        }
        if ($length -eq 5) {
            $readingOutput += '3'
        }
        if ($length -eq $four) {
            $readingOutput += '4'
        }
        if ($item -contains 'e' -and $length -eq 5) {
            $readingOutput += '5'
        }
        if ($length -eq 6 -and $item -contains 'f' -and $item -contains 'g') {
            $readingOutput += '6'
        }
        if ($length -eq $seven) {
            $readingOutput += '7'
        }
        if ($length -eq $eight) {
            $readingOutput += '8'
        }
        if ($length -eq 6 -and $item -contains 'f' -and $item -contains 'a') {
            $readingOutput += '9'
        }
        if ($length -eq 6 -and $item -contains 'a' -and $item -contains 'g') {
            $readingOutput += '0'
        }
    }

    Write-Host "String [$output] output converted to : [$readingOutput]"
}

return