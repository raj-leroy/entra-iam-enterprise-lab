function Get-GroupId {
  param([string]$Name)
  (Get-MgGroup -Filter "displayName eq '$Name'" -All -ConsistencyLevel eventual -ErrorAction Stop |
    Select-Object -First 1).Id
}

function Ensure-Member {
  param([string]$GroupId,[string]$UserId)

  $members = Get-MgGroupMember -GroupId $GroupId -All -ErrorAction SilentlyContinue
  if ($members.Id -contains $UserId) { return $false }

  New-MgGroupMemberByRef -GroupId $GroupId -BodyParameter @{
    "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$UserId"
  } -ErrorAction Stop | Out-Null

  return $true
}

$map = @(
  @{ From="SG-Role-Global-Admin";      To="RAG-Global-Admin" },
  @{ From="SG-Role-Application-Admin"; To="RAG-Application-Admin" },
  @{ From="SG-Role-User-Admin";        To="RAG-User-Admin" },
  @{ From="SG-Role-Security-Reader";   To="RAG-Security-Reader" }
)

foreach ($m in $map) {
  $fromId = Get-GroupId -Name $m.From
  $toId   = Get-GroupId -Name $m.To

  $fromMembers = Get-MgGroupMember -GroupId $fromId -All
  foreach ($mem in $fromMembers) {
    $added = Ensure-Member -GroupId $toId -UserId $mem.Id
    if ($added) { Write-Host "Added member $($mem.Id) -> $($m.To)" }
  }
}

Write-Host "Done. Members copied."
