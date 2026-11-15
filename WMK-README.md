# WMK Film Studio — distribuição WMK

Fork de [FilmCraft](https://github.com/storytold/filmcraft), editor de vídeo em Rust. As atribuições, avisos legais e licenças originais devem ser preservados.

## Compilar e baixar no GitHub Actions

1. Abra **Actions > WMK Film Studio - Windows x64 > Run workflow**.
2. Aguarde a conclusão do job **Windows x64 ZIP**.
3. Na página da execução, em **Artifacts**, baixe **WMK-Film-Studio-Windows-x64**.
4. Extraia o ZIP e abra **WMK-Film-Studio.exe**.

O workflow é independente dos workflows compartilhados do projeto original e **não requer certificado de assinatura**. Assim, o Windows pode exibir um alerta SmartScreen de aplicativo não assinado. Não há garantia de build até o workflow ser executado e aprovado.

O binário mantém o nome interno Cargo `filmcraft`, para evitar quebrar crates e automação; o ZIP expõe o nome WMK Film Studio. A substituição completa dos ícones e da identidade do atualizador deve ser feita em uma etapa específica, preservando a compatibilidade.

## Idioma

O projeto já inclui português brasileiro: `crates/ui-egui/src/i18n/pt-br.tsv`. Abra **Edit > Language > Português (Brasil)**, ou **Settings > General > Interface Language**, para selecionar o idioma. Para auditar o catálogo: `cargo xtask i18n-report`.

## Identidade

Proposta de produto: **WMK Film Studio**. Créditos WMK solicitados: Walney Moreira Klein — walneyk@hotmail.com. Preservar créditos existentes em `NOTICE` e `ATTRIBUTION.md`. A logo WMK reduzida está em `assets/wmk/`; o workflow Windows executa `scripts/gerar-icone-wmk.py` antes da compilação, embutindo um ICO derivado. Para distribuição definitiva, atualizar a matriz para alta resolução.

## Verificações locais

```powershell
cargo check --locked -p filmcraft -p filmcraft-cli
cargo test --locked -p filmcraft-ui-egui --lib
cargo build --release --locked -p filmcraft -p filmcraft-cli
```
