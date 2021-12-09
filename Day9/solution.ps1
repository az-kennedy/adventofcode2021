# Using the heightmap find the lowest points.  Smoke flows to the lowest points
# Your first goal is to find the low points - the locations that are lower 
# than any of its adjacent locations.

#$data = Get-Content .\Day9\data.txt

$data = '2199943210
3987894921
9856789892
8767896789
9899965678'

$heightmap = $data.Split([Environment]::NewLine)

# some cleanup . . . 
$heightmapNew = @()
foreach ($row in $heightmap) {
  if ($row -ne '') {
    $heightmapNew += $row
  }
}

$up           = 0
$down         = 0
$left         = 0
$right        = 0
$previousRow  = ''
$nextRow      = ''


function Find-LowPoint {
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

  Write-Host "Previous Row: [$PreviousRowCA]"
  Write-Host "Current Row: [$CurrentRowCA]"
  Write-Host "Next Row: [$NextRowCA]"
  

  for ($i = 0; $i -lt $CurrentRowCA.Count; $i++) {
    $number = $CurrentRowCA[$i]
    #Write-Host "Current Number: [$number]"
    try{$up = $PreviousRowCA[$i]}catch{$up = ''}
    try{$down = $NextRowCA[$i]}catch{$down = ''}
    try{$left = $CurrentRowCA[$($i-1)]}catch{$left = ''}
    try{$right = $CurrentRowCA[$($i+1)]}catch{$right = ''}

    $myArray = @([int][string]$number,[int][string]$up,[int][string]$down,[int][string]$left,[int][string]$right)
    
    Write-Host "MyArray = [$myArray]"

    $lowest = ($myArray | Measure-Object).Minimum

    if ($lowest -eq $number) {
      Write-Host "Low point of [$number]"
      return $number
    }
  }
  Write-Host ""
}

$sum = 0

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

  $LowPoint = Find-LowPoint -PreviousRow $previousRow -CurrentRow $currentRow -NextRow $nextRow
  $sum += $LowPoint

}

return "Sum of low points: [$sum]"