# Reated by CR1V0

$url = Read-Host -Prompt 'Inform URL that contains files (.tar.gz): '
#$url = 'https://www.kgay4all.com/seioqueseiporleroqueleio/Offsensive/'

# Resquest to web site
$response = (Invoke-WebRequest -Uri $url).Links | select href 

# Select all files .tar.gz
$files = @($response | ? href -Like *tar.gz*)

# Save result on temp-file
$files| Out-File -FilePath .temp-file.txt

# Read temp-file
$read = @(Get-Content .temp-file.txt)

# Comcat file + url
foreach($item in $read){
  if($item -gt 3){
    Invoke-WebRequest -Uri "$url$item" -OutFile $item
  }
} 
