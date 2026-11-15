# Manual 03 — Desenvolvimento, compilação, MCP e manutenção

## 1. Organização do código
O workspace Rust separa aplicações em `apps/` e bibliotecas em `crates/`. O fluxo central é motor **headless** + comandos estáveis + interface egui; por isso mudanças de UI não devem alterar contratos internos sem migração.

| Componente | Diretório |
|---|---|
| Desktop | `apps/filmcraft` |
| CLI/MCP | `apps/filmcraft-cli` |
| Navegador | `apps/filmcraft-web` |
| Interface | `crates/ui-egui` |
| Sessão e comandos | `crates/engine` |
| Edição | `crates/edit` |
| Render e GPU | `crates/render`, `crates/gpu` |
| Legendas/voz | `crates/captions`, `crates/speech`, `crates/tts` |

## 2. Compilação local Windows
Instale Rust MSVC 1.95, Build Tools C++, Git e demais dependências da árvore Cargo.

```powershell
git clone https://github.com/WalneyNF/WMK-Film-Studio.git
cd WMK-Film-Studio
python scripts/gerar-icone-wmk.py
cargo check --locked -p filmcraft -p filmcraft-cli
cargo build --release --locked -p filmcraft -p filmcraft-cli
```

O script prepara o recurso .ico a partir da miniatura WMK para o build do Windows; mantenha um PNG original de alta resolução no processo de identidade definitivo. Os binários Cargo são `target/release/filmcraft.exe` e `filmcraft-cli.exe`; o workflow empacota com o nome público `WMK-Film-Studio.exe`.

## 3. GitHub Actions
O workflow `.github/workflows/wmk-windows.yml` gera ZIP como **artifact** de execução. O workflow `.github/workflows/wmk-public-release.yml` foi feito para publicar um pacote de uma compilação **específica e validada**; não reutilize um run antigo para anunciar código novo sem recompilação.

Fluxo de qualidade: pull request → check/test → build x64 → validar importação/exportação → publicar pré-release com notas de versão e checksum → disponibilizar download público.

## 4. Tradução
O catálogo `crates/ui-egui/src/i18n/pt-br.tsv` usa colunas separadas por TAB (contexto, original, tradução). Strings não traduzidas caem em inglês. Mantenha placeholders como `{name}`, revise termos e rode `cargo xtask i18n-report`.

## 5. IA e MCP
O servidor `filmcraft-cli mcp` expõe comandos e inspeção de sequências. O desktop pode usar canal JSON local com `FILMCRAFT_CONTROL_TOKEN`. O token deve ser aleatório, secreto, restrito à sessão e nunca enviado a repositórios ou logs. Não exponha o canal na rede pública. Agentes que editam projetos precisam de validação, preview, undo e confirmação em operações destrutivas.

Leia [docs/agents.md](../docs/agents.md), [docs/control-protocol.md](../docs/control-protocol.md) e [docs/architecture.md](../docs/architecture.md).

## 6. Testes e segurança
- Execute `cargo test --locked` e Clippy conforme a matriz de CI.
- Teste abertura e exportação com arquivos reais, codecs variados e mídias de taxa variável.
- Verifique o fallback em máquinas sem GPU compatível.
- Evite logs com dados pessoais ou segredos.
- Preserve `NOTICE`, `ATTRIBUTION.md`, `LICENSE-MIT` e `LICENSE-APACHE`.
- Em bugs, anote versão, sistema, GPU, mídia de reprodução, passos, resultado esperado e observado.

## 7. Política de evolução
Acompanhe tarefas no [roadmap HTML](../roadmap.html). Só marque como concluído quando houver código integrado e teste associado. A fase inicial pública foi compilada e publicada, porém não implica validação de todos os recursos.
