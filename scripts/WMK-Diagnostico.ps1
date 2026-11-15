# WMK Film Studio - Diagnostico local para Windows
# Executa apenas consultas; nao altera drivers, registro ou preferências.
[CmdletBinding()]
param(
  [string]$PastaAplicativo = (Get-Location).Path,
  [string]$Saida = "",
  [switch]$AbrirRelatorio
)
$ErrorActionPreference = "Stop"
$dados = [ordered]@{
  ferramenta = "WMK Film Studio - Diagnostico"
  versaoRelatorio = 1
  geradoEm = (Get-Date).ToString("o")
  sistema = [ordered]@{}
  memoriaGB = $null
  processador = $null
  gpus = @()
  executavelPresente = $false
  executavelBytes = $null
  observacoes = @()
}
try {
  $os = Get-CimInstance Win32_OperatingSystem
  $dados.sistema = [ordered]@{ nome = $os.Caption; versao = $os.Version; arquitetura = $os.OSArchitecture }
  $dados.memoriaGB = [math]::Round([double]$os.TotalVisibleMemorySize / 1MB, 2)
} catch { $dados.observacoes += "Sistema operacional: consulta CIM indisponivel." }
try {
  $cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
  $dados.processador = $cpu.Name
} catch { $dados.observacoes += "CPU: consulta CIM indisponivel." }
try {
  $dados.gpus = @(Get-CimInstance Win32_VideoController | ForEach-Object {
    [ordered]@{
      nome = $_.Name
      driver = $_.DriverVersion
      memoriaRelatadaGB = if ($null -ne $_.AdapterRAM) { [math]::Round([double]$_.AdapterRAM / 1GB, 2) } else { $null }
    }
  })
} catch { $dados.observacoes += "GPU: consulta CIM indisponivel." }
$app = Join-Path $PastaAplicativo "WMK-Film-Studio.exe"
if (-not (Test-Path -LiteralPath $app -PathType Leaf)) {
  $app = Join-Path $PastaAplicativo "filmcraft.exe"
}
if (Test-Path -LiteralPath $app -PathType Leaf) {
  $dados.executavelPresente = $true
  $dados.executavelBytes = (Get-Item -LiteralPath $app).Length
} else {
  $dados.observacoes += "Nao foi encontrado WMK-Film-Studio.exe nem filmcraft.exe na pasta informada."
}
if ($dados.gpus.Count -eq 0) { $dados.observacoes += "Sem GPU identificada. Confirme os drivers antes de usar efeitos pesados." }
if (-not $Saida) { $Saida = Join-Path (Get-Location).Path "WMK-Diagnostico.json" }
$pastaSaida = Split-Path -Parent $Saida
if ($pastaSaida -and -not (Test-Path -LiteralPath $pastaSaida)) {
  New-Item -ItemType Directory -Path $pastaSaida -Force | Out-Null
}
$json = $dados | ConvertTo-Json -Depth 6
[System.IO.File]::WriteAllText([System.IO.Path]::GetFullPath($Saida), $json, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Relatorio criado em: $([System.IO.Path]::GetFullPath($Saida))"
Write-Host "Nenhuma alteracao foi feita no Windows."
Write-Host "O JSON inclui dados de sistema e hardware. Revise antes de compartilhar."
if ($AbrirRelatorio) { Invoke-Item -LiteralPath ([System.IO.Path]::GetFullPath($Saida)) }
