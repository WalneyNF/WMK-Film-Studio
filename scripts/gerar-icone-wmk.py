#!/usr/bin/env python3
"""Gera recursos ICO do fork WMK usando o PNG de referência versionado.
Somente biblioteca padrão. O recurso PNG já foi reduzido para a interface;
substitua o PNG de referência pela matriz autorizada em resolução maior para
um ícone de distribuição final com maior qualidade.
"""
from pathlib import Path
import struct

root = Path(__file__).resolve().parents[1]
png = (root / "assets/wmk/wmk-film-studio-64.png").read_bytes()
assert png[:8] == b"\x89PNG\r\n\x1a\n", "Arquivo de logo deve ser PNG"
width, height = struct.unpack(">II", png[16:24])
if not (1 <= width <= 256 and 1 <= height <= 256):
    raise SystemExit("Logo PNG fora do limite suportado para ICO.")
header = struct.pack("<HHH", 0, 1, 1)
entry = struct.pack("<BBBBHHII", width % 256, height % 256, 0, 0, 1, 32, len(png), 22)
target = root / "assets/app-icon/filmcraft.ico"
target.write_bytes(header + entry + png)
print(f"Icone WMK gerado: {target} ({width}x{height})")
