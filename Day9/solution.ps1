# Using the heightmap find the lowest points.  Smoke flows to the lowest points
# Your first goal is to find the low points - the locations that are lower 
# than any of its adjacent locations.

$data = Get-Content C:\Users\Thomas\Documents\code\REPOS\adventofcode2021\Day9\data.txt

#$data = '2199943210
#3987894921
#9856789892
#8767896789
#9899965678'

$heightmap = $data.Split([Environment]::NewLine)

# some cleanup . . . 
$heightmapNew = @()
foreach ($row in $heightmap) {
  if ($row -ne '') {
    $heightmapNew += $row
  }
}

function Find-LowPointRisk {
  param (
    # Previous Row
    [String]
    $PreviousRow,

    # Current Row
    [String]
    $CurrentRow,

    # Next Row
    [String]
    $NextRow
  )

  $PreviousRowCA = $PreviousRow.ToCharArray()
  $CurrentRowCA = $CurrentRow.ToCharArray()
  $NextRowCA = $NextRow.ToCharArray()
  $rowRisk = 0

  Write-Host "Previous Row: [$PreviousRowCA]"
  Write-Host "Current Row: [$CurrentRowCA]"
  Write-Host "Next Row: [$NextRowCA]"
  

  for ($i = 0; $i -lt $CurrentRowCA.Count; $i++) {
    $myArray = @()
    [int][string]$number = $CurrentRowCA[$i]
    $myArray += $number
    #Write-Host "Current Number: [$number]"
    try{
      $up = $PreviousRowCA[$i]
      if($up){$myArray += [int][string]$up}
    }catch{$up = ''}
    try{
      $down = $NextRowCA[$i]
      if($down){$myArray += [int][string]$down}
    }catch{$down = ''}
    try{
      $left = $CurrentRowCA[$($i-1)]
      if($left){$myArray += [int][string]$left}
    }catch{$left = ''}
    try{
      $right = $CurrentRowCA[$($i+1)]
      if($right){$myArray += [int][string]$right}
    }catch{$right = ''}
    
    
    #Write-Host "MyArray = [$myArray]"

    $lowest = ($myArray | Measure-Object -Minimum).Minimum
    $max = ($myArray | Measure-Object -Maximum).Maximum

    #Write-Host "Lowest : $lowest"

    if ($lowest -eq $number -and $lowest -ne $max) {
      Write-Host "Low point of [$number], risk level of [$($number+1)]"
      $rowRisk += $number +1
      #return $number
    }
  }
  Write-Host ""
  return $rowRisk
}

$riskSum = 0

for ($i = 0; $i -lt $heightmapNew.Count; $i++) {
  try{
    if ($i -eq 0) {
      $previousRow = ''
    } else {
      $previousRow = $heightmapNew[$i-1]
    }
  }catch{$previousRow = ''}
  $currentRow = $heightmapNew[$i]
  try{$nextRow = $heightmapNew[$i+1]}catch{$nextRow = ''}

  $rowRisk = Find-LowPointRisk -PreviousRow $previousRow -CurrentRow $currentRow -NextRow $nextRow
  $riskSum += $rowRisk

}

return "Sum of risk points: [$riskSum]"