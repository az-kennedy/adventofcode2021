
$depthReadings = @(199,200,208,210,200,240,269,260,263)
$lastReading = 0
$increaseCnt = 0
$decreaseCnt = 0

foreach ($reading in $depthReadings) {
  #Write-Host "$($reading.gettype())"
  Write-Host ""
  Write-Host "LastReading = $lastReading"
  Write-Host "Reading = $reading"
  
  # If first reading . . .
  if ($lastReading -eq 0) {
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
  $lastReading = $reading
}

return "
Depth increased $increaseCnt and decreased $decreaseCnt during the readings.
"