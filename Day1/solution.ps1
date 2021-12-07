
#$depthReadings = @(199,200,208,210,200,207,240,269,260,263)
$depthReadings = Get-Content .\data.txt

$lastReading = 171
$increaseCnt = 1
$decreaseCnt = 0
$sameCnt     = 0

foreach ($reading in $depthReadings) {
  $reading = [int]$reading
  #Write-Host ""
  #Write-Host "LastReading = $lastReading"
  #Write-Host "Reading = $reading"
  
  # If first reading . . .
  if ($lastReading -eq 171) {
    $lastReading = $reading
    continue
  }
  if ($reading -gt $lastReading) {
    Write-Host "Increasing . . ."
    $increaseCnt += 1
  } 
  if ($reading -lt $lastReading) {
    Write-Host "Decreasing . . ."
    $decreaseCnt += 1
  }
  if ($reading -eq $lastReading) {
    Write-Host "Same Depth . . ."
    $sameCnt += 1
  }
  $lastReading = $reading
}

return "
Depth increased $increaseCnt and decreased $decreaseCnt and stayed the same $sameCnt times during the readings.
"