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
#$nine = 'abcdfg'
$zero = 'cagedb'
#$zero = 'abcegf'


$sum = 0

$readings = $data.Split([Environment]::NewLine)


foreach ($reading in $readings) {
    if ($reading -eq '') {
        continue
    }
    $signalWires = $reading.Split('|')[0]
    $output = $reading.Split('|')[1]
    try{$output = $output.Trim()}catch{}

    $oneRead = $output.Split(' ')
    $readingOutput = ''
    $tmpstr = ''
    $sum = 0

    foreach ($item in $oneRead) {
      $length = $item.Length
        
      # Part One: Handle the knowns already 1,4,7,8 . . .
      if ($length -eq $one) {
        $tmpstr = '1'
      }
      if ($length -eq $four) {
        $tmpstr = '4'
      }
      if ($length -eq $seven) {
        $tmpstr = '7'
      }
      elseif ($length -eq $eight) {
        $tmpstr = '8'
      }


      # Part two: Handle the others 2,3,5,6,9,0
      if ($length -eq 5) {
        $tmpstr = '3'
        if ($item -contains 'g') {
          $tmpstr = '2'
        }
        if ($item -contains 'e') {
          $tmpstr = '5'
        }
      }
      
      if ($length -eq 6){
        if (($item -notcontains 'd') -or ($item -notcontains 'b') -or ($item -notcontains 'a')) {
          $tmpstr = '6'
          Write-Host "Six"
        }
        if ($item -notcontains 'g') {
          $tmpstr = '9'
        }
        if ($item -notcontains 'f' -and $item -contains 'g') {
          $tmpstr = '0'
        }
      }


        $readingOutput += $tmpstr
        $tmpstr = ''
    }



    Write-Host "String [$output] output converted to : [$readingOutput]"
}

return