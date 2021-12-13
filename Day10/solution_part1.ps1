
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

# Initialize some vars . . . 
$points = @{')'= 3; ']' = 57; '}'= 1197; '>'= 25137}
#$Queue = New-Object System.Collections.Queue

# Push character to a Queue
function New-Push {
  param (
    [Parameter(Mandatory=$true)]
    [string]
    $pushChar,

    [Parameter(Mandatory=$true)]
    [string]
    $Queue
  )

  $Queue.Enqueue($pushChar)
  return
}

# Pop character from the Queue
function New-Pop {
  param (
    [Parameter(Mandatory=$true)]
    [string]
    $popChar,
    
    [Parameter(Mandatory=$true)]
    [string]
    $Queue
  )

  $retval = $Queue.Dequeue()

  return $retval
}



foreach ($row in $syntaxCleaned) {
  $characters = $row.ToCharArray()
  $QueueP  = New-Object System.Collections.Queue
  $QueueB  = New-Object System.Collections.Queue
  $QueueS  = New-Object System.Collections.Queue
  $QueueLT = New-Object System.Collections.Queue

  Write-Host $row
  foreach ($char in $characters) {
    if ($char -eq '(') {
      $QueueP.Enqueue('(')
    }
    if ($char -eq '[') {
      $QueueB.Enqueue('[')
    }
    if ($char -eq '{') {
      $QueueS.Enqueue('{')
    }
    if ($char -eq '<') {
      $QueueLT.Enqueue('<')
    }

    # Now Dequeue if condition is met
    try {
      if ($char -eq ')') {
        $QueueP.Dequeue()
      }
      if ($char -eq ']') {
        $QueueB.Dequeue()
      }
      if ($char -eq '}') {
        $QueueS.Dequeue()
      }
      if ($char -eq '>') {
        $QueueLT.Dequeue()
      }
    }
    catch {
      Write-Host "Caught rogue character [$char]"
    }
    

  }

  if (($QueueP.Count -gt 0) -and ($QueueB.Count -gt 0) -and ($QueueS.Count -gt 0) -and ($QueueLT.Count -gt 0)) {
    Write-Host "Caught rogue character"
  }
  
}


return