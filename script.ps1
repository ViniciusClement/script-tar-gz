# Created by CR1V0
# This program is designed for study only


$url = Read-Host -Prompt 'Enter the URL containing the files (tar.gz) '
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
