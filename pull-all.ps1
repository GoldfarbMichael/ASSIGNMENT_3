# pull-all.ps1
Write-Host "`n Pulling main wrapper repository (ASSIGNMENT_3)..." -ForegroundColor Cyan
git pull origin main

Write-Host "`n Updating submodules..." -ForegroundColor Cyan
git submodule update --init --recursive

Write-Host "`n Pulling backend (assignment3.2)..." -ForegroundColor Cyan
cd 212112106_209507763_assignment3.2
git pull origin main
cd ..

Write-Host "`n Pulling frontend (assignment3.3)..." -ForegroundColor Cyan
cd 212112106_209507763_assignment3.3
git pull origin main
cd ..

Write-Host "`n All repositories updated successfully." -ForegroundColor Green
