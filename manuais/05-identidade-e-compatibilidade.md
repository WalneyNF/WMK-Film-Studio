# Identidade visual e compatibilidade — WMK Film Studio

**Nome público:** WMK Film Studio.

**Logo oficial:** arte aprovada pelo mantenedor, com versões de distribuição em `assets/wmk/`. A miniatura atualmente versionada tem 64×64 pixels. A imagem de origem aprovada em alta resolução precisa ser incorporada antes de afirmar que o ícone está finalizado em todos os sistemas.

## Pontos de marca
- Janela, título, diálogos e logs do aplicativo desktop: `apps/filmcraft/src/main.rs`.
- Tela Sobre, créditos WMK e autores originais: `crates/ui-egui/src/panels/dialogs.rs`.
- Marca desenhada na interface: `crates/ui-egui/src/brand.rs`.
- Ícone no Windows: `scripts/gerar-icone-wmk.py` executado antes do build no Actions.
- Empacotamento Windows: `packaging/windows/filmcraft.wxs`; macOS: `packaging/macos/Info.plist.in`; Linux: arquivo `.desktop`.
- Versão Web: `apps/filmcraft-web/web/index.html`.

## O que continua com o nome interno FilmCraft

A migração visual **não** renomeia automaticamente crates Rust (`filmcraft-*`), classes (`FilmcraftApp`), arquivos `.fcproj`, nomes de comandos do MCP/CLI, chaves de configuração (`FILMCRAFT_*`), associações MIME, IDs Linux e identificador de pacote. Esses nomes são contratos técnicos e devem ser migrados somente com testes de compatibilidade, para não inutilizar projetos nem integração de terceiros.

O atualizador herdado do FilmCraft não deve ser usado para instalar uma versão do upstream sobre uma distribuição WMK. A checagem automática de atualizações foi desativada na inicialização Windows; a migração do atualizador e a revisão dos comandos manuais continuam pendentes.

## Licenças
A identidade WMK não transfere a propriedade de marcas ArtCraft ou do código original. Manter `NOTICE`, `ATTRIBUTION.md`, `LICENSE-MIT` e `LICENSE-APACHE`, assim como créditos dos colaboradores.

WMK: **Walney Moreira Klein — walneyk@hotmail.com**.
