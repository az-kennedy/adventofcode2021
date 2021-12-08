$data = Get-Content C:\Users\Thomas\Documents\code\REPOS\adventofcode2021\Day8\data.txt

#$data = 'be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
#edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
#fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
#fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
#aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
#fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
#dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
#bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
#egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
#gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce'


$one = 2
$four = 4
$seven = 3
$eight = 7
$count = 0

$readings = $data.Split([Environment]::NewLine)


foreach ($reading in $readings) {
    if ($reading -eq '') {
        continue
    }
    $input = $reading.Split('|')[0]
    $output = $reading.Split('|')[1]
    try{$output = $output.Trim()}catch{}

    $oneRead = $output.Split(' ')

    foreach ($item in $oneRead) {
        if (($item.Length -eq $one) -or ($item.Length -eq $four) -or ($item.Length -eq $seven) -or ($item.Length -eq $eight)) {
            $count += 1
        }
    }
}

return $count