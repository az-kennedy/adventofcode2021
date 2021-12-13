
#$data = Get-Content C:\Users\Thomas\Documents\code\REPOS\adventofcode2021\Day10\data.txt

$data = '
[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]'

$syntax = $data.Split([Environment]::NewLine)

# some cleanup . . . 
$syntaxCleaned = @()
foreach ($row in $syntax) {
  if ($row -ne '') {
    $syntaxCleaned += $row
  }
}

$points = @{')'= 3; ']' = 57; '}'= 1197; '>'= 25137}




foreach ($row in $syntaxCleaned) {
  $characters = $row.ToCharArray()
  $queue

  foreach ($char in $characters) {
    if ($char -eq '(') {
      
    }

  }
  
}


return 