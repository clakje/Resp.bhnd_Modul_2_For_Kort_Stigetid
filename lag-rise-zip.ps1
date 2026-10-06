<#
    lag-rise-zip.ps1 — lager zip-filen som lastes opp i Articulate Rise.

    Tar bare med filene spilleren trenger i nettleseren, med index.html i roten
    av zip-filen (det krever Rise). Kjør bygg-scenario-data.js først hvis
    scenario.json er endret.

        powershell -ExecutionPolicy Bypass -File lag-rise-zip.ps1
#>
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

$filer = @(
    'index.html',
    'app.js',
    'simulator.js',
    'renderer.js',
    'style.css',
    'player.css',
    'scenario-data.js',
    'scenario.json'
)
$zip = 'for-kort-stigetid-player.zip'

foreach ($f in $filer) {
    if (-not (Test-Path $f)) { throw "Mangler $f" }
}
if (Test-Path $zip) { Remove-Item $zip -Force }

Compress-Archive -Path $filer -DestinationPath $zip
Write-Host "Skrev $zip ($($filer.Count) filer)"
