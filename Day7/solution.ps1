$crabPositions = Get-Content .\data.txt
#$crabPositions = '16,1,2,0,4,2,7,1,2,14'


$positions = $crabPositions.Split(',')

$max = ($positions | Measure-Object -Maximum).Maximum
#$min = ($positions | Measure-Object -Minimum).Minimum

$lowestFuelCost = 0
$index = 0

for ($i = 0; $i -lt $max; $i++) {
  $fuelSpent = 0
  foreach ($crab in $positions) {
    $fuelSpent += $([Math]::Abs($crab - $i))
  }

  if ($lowestFuelCost -eq 0) {
    $lowestFuelCost = $fuelSpent
    $index = $i
  }
  if ($fuelSpent -lt $lowestFuelCost) {
    $lowestFuelCost = $fuelSpent
    $index = $i
  }
}

return "Lowest Fuel Spent for crab submarine is [$lowestFuelCost] at position [$index]"