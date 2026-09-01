# CSV file path
$csvPath = ".\resource.csv"

# Output terraform.tfvars file
$tfvarsPath = ".\terraform.tfvars"

# CSV read karo
$data = Import-Csv $csvPath

# Pehli row read karo
$resource = $data[0]

# terraform.tfvars create karo (rg_details object format me)
@"
rg_details = {
  name        = "$($resource.resource_group_name)"
  location    = "$($resource.location)"
  environment = "$($resource.environment)"
}
"@ | Out-File -FilePath $tfvarsPath -Encoding utf8

Write-Host "===================================="
Write-Host "terraform.tfvars created successfully"
Write-Host "===================================="
Write-Host "Output File: $tfvarsPath"