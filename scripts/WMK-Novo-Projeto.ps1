# WMK Film Studio - Novo Projeto / Organizador de pastas
# Nao substitui o formato nativo .fcproj do FilmCraft.
[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)][string]$Nome,
  [string]$Destino = (Get-Location).Path,
  [ValidateSet("720p","1080p","4K")][string]$Preset = "1080p"
)
$ErrorActionPreference = "Stop"
$Nome = $Nome.Trim()
if ([string]::IsNullOrWhiteSpace($Nome) -or $Nome -match '[<>:"/\\|?*\x00-\x1F]' -or $Nome.EndsWith('.')) {
  throw "Nome invalido. Use um nome simples, sem barras ou caracteres especiais do Windows."
}
if (-not (Test-Path -LiteralPath $Destino -PathType Container)) {
  throw "A pasta de destino nao existe: $Destino"
}
$root = Join-Path $Destino $Nome
if (Test-Path -LiteralPath $root) {
  throw "Ja existe um arquivo ou pasta com este nome. Nenhum arquivo foi sobrescrito: $root"
}
New-Item -ItemType Directory -Path $root -ErrorAction Stop | Out-Null
foreach($sub in @("01-originais","02-audio","03-imagens","04-projetos","05-proxies","06-exportacoes","07-backups","08-relatorios")) {
  New-Item -ItemType Directory -Path (Join-Path $root $sub) | Out-Null
}
$presets = @{
  "720p" = @{ largura=1280; altura=720 }
  "1080p" = @{ largura=1920; altura=1080 }
  "4K" = @{ largura=3840; altura=2160 }
}
$manifest = [ordered]@{
  schema = "wmk-project-folder-v1"
  tipo = "organizacao-de-arquivos-nao-fcproj"
  nome = $Nome
  criadoEm = (Get-Date).ToString("o")
  preset = $Preset
  largura = $presets[$Preset].largura
  altura = $presets[$Preset].altura
  observacao = "Abra o WMK Film Studio e salve seu projeto .fcproj na pasta 04-projetos."
}
$path = Join-Path $root "wmk-projeto.json"
[System.IO.File]::WriteAllText($path, ($manifest | ConvertTo-Json -Depth 5), (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Pasta de projeto criada: $root"
Write-Host "Manifesto criado: $path"
Write-Host "Abra o editor e salve o arquivo .fcproj na pasta 04-projetos."
