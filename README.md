<p align="center"><img src="assets/wmk/wmk-film-studio-64.png" alt="Logo WMK Film Studio" width="128"></p>
<p align="center"><img src="docs/images/filmcraft-hero.png" alt="Editor FilmCraft, base tecnológica da edição WMK" width="900"></p>

# WMK Film Studio

**Editor de vídeo não linear, de código aberto, desenvolvido em Rust — versão WMK para estudos, testes e evolução da ferramenta.**

[![Licença](https://img.shields.io/badge/licença-MIT%20OU%20Apache--2.0-8b5cf6)](LICENSE-MIT)
[![Rust](https://img.shields.io/badge/linguagem-Rust-orange)](Cargo.toml)
[![Windows](https://img.shields.io/badge/build-Windows%20x64-blue)](.github/workflows/wmk-windows.yml)

> **Estado do projeto:** este fork usa o motor FilmCraft / ArtCraft e ainda está em desenvolvimento. Recursos listados abaixo são capacidades documentadas do projeto-base; compatibilidade, desempenho e estabilidade variam. O executável WMK será considerado validado somente após a compilação e os testes.

**Projeto WMK:** Walney Moreira Klein — walneyk@hotmail.com  
**Código-base:** [FilmCraft, equipe ArtCraft](https://github.com/storytold/filmcraft). Veja [Créditos e licenças](#créditos-e-licenças).

**[📥 Baixar versão experimental Windows](https://github.com/WalneyNF/WMK-Film-Studio/releases/tag/wmk-v0.20.1-estudos.1)** · **[📚 Manuais](manuais/README.md)** · **[🗺️ Roadmap interativo](roadmap.html)**

> A logo nesta página é uma miniatura reduzida da arte oficial aprovada. Os ícones de compilação são gerados a partir dela; o original em alta resolução deve ser conservado como matriz da identidade.

## Índice

- [O que é o projeto](#o-que-é-o-projeto)
- [Principais recursos](#principais-recursos)
- [Baixar o executável de estudos (Windows)](#baixar-o-executável-de-estudos-windows)
- [Compilar no próprio computador](#compilar-no-próprio-computador)
- [Como usar em português](#como-usar-em-português)
- [Formatos e exportação](#formatos-e-exportação)
- [Agentes e automação MCP](#agentes-e-automação-mcp)
- [Arquitetura](#arquitetura)
- [Limitações atuais e melhorias WMK](#limitações-atuais-e-melhorias-wmk)
- [Créditos e licenças](#créditos-e-licenças)

## O que é o projeto

O WMK Film Studio é um fork experimental do FilmCraft. Seu motor foi desenvolvido em Rust e separa a interface de usuário, a edição, os codecs, o áudio, a composição e os comandos de automação. Há aplicativos para desktop, linha de comando e uma variante WebAssembly em desenvolvimento.

O objetivo da versão WMK é oferecer documentação em português brasileiro, uma distribuição fácil de testar no Windows, melhorias para computadores modestos e integração progressiva com agentes de IA. **Essas melhorias são metas, não uma promessa de que já estejam prontas.**

## Principais recursos

### Edição e organização
- Linha do tempo com múltiplas faixas de vídeo e áudio.
- Monitores de origem e de resultado, pastas de mídia, marcadores e seleção vinculada.
- Inserir/sobrescrever, lâmina, ripple, roll, slip, slide e ajuste de velocidade.
- Edição por três pontos (entrada e saída), atalhos configuráveis, histórico e desfazer.
- Salvamento automático e mecanismo de recuperação após falhas.

![Timeline do FilmCraft](docs/images/filmcraft-timeline.png)

### Cores, efeitos e animação
- Correção básica, curvas, rodas de cor, HSL secundário e vinheta.
- Efeitos visuais, transições, modos de mesclagem e máscaras.
- Animação por quadros-chave com interpolação e curvas.
- Composição por GPU com caminho alternativo por CPU para determinados recursos.

![Área de cores](docs/images/filmcraft-color.png)

### Áudio e legendas
- Mixer de faixas e clipes, equalização, filtros, reverberação e controle de ganho.
- Medição de intensidade sonora em LUFS e automações por faixa.
- Edição e exportação de legendas; suporte documentado a SRT e WebVTT.
- Módulos opcionais de transcrição e narração neural (Whisper e Kokoro) que podem exigir modelos adicionais e compilação com *features* específicas.

### Exportação
- Fluxos documentados para H.264/MP4, ProRes, DNxHR, WAV, GIF animado e sequências de imagens.
- Renderização em tarefas, prévias e indicadores de progresso.
- A disponibilidade de exportação por hardware depende do sistema operacional, dos drivers e da GPU.

![Exportação](docs/images/filmcraft-export.png)

## Baixar o executável de estudos (Windows)

**O GitHub Actions pode gerar o EXE sem precisar compilar Rust no seu computador.** A distribuição de estudos é um arquivo ZIP; ela não é um instalador assinado.

1. Abra a página [Actions deste fork](https://github.com/WalneyNF/WMK-Film-Studio/actions).
2. Selecione **WMK Film Studio - Windows x64**.
3. Clique em **Run workflow** e execute na branch disponível que contém `.github/workflows/wmk-windows.yml`.
4. Ao terminar com sucesso, abra a execução e procure **Artifacts**.
5. Baixe **WMK-Film-Studio-Windows-x64**, extraia o ZIP e execute `WMK-Film-Studio.exe`.

O pacote também contém `filmcraft-cli.exe` (linha de comando e MCP), `NOTICE`, `ATTRIBUTION.md` e os arquivos de licença. Como a compilação de estudos não é assinada, o Windows poderá mostrar um aviso de reputação do aplicativo. Verifique a origem e o conteúdo antes de executar.

**Atenção:** a presença do workflow não garante que uma execução tenha sido concluída. Consulte o resultado e os logs do Actions; se falhar, não existe EXE válido naquela execução.

## Compilar no próprio computador

Requisitos básicos: Windows x64, Rust 1.95 (MSVC), ferramentas de compilação C++ do Visual Studio e dependências exigidas pelo projeto.

```powershell
git clone https://github.com/WalneyNF/WMK-Film-Studio.git
cd WMK-Film-Studio
cargo build --release --locked -p filmcraft -p filmcraft-cli
```

Se a compilação terminar corretamente, os binários produzidos pelo Cargo estarão em `target/release/filmcraft.exe` e `target/release/filmcraft-cli.exe`. O workflow Windows copia o primeiro para o nome de distribuição `WMK-Film-Studio.exe`, sem renomear internamente as crates Rust.

Teste rápido (quando o aplicativo compilar):

```powershell
cargo run --release -p filmcraft -- --demo
cargo run --release -p filmcraft-cli -- commands
```

## Como usar em português

O código já possui tradução brasileira em `crates/ui-egui/src/i18n/pt-br.tsv`.

No aplicativo, procure **Editar → Idioma → Português (Brasil)** ou **Configurações/Preferências → Geral → Idioma da interface**, conforme o idioma ativo. O idioma pode acompanhar o sistema automaticamente. Alguns erros internos, comandos da CLI e retornos de MCP ainda estão em inglês.

Para conferir a cobertura do catálogo, no terminal:

```powershell
cargo xtask i18n-report
```

A revisão de terminologia e de strings ainda não localizadas está entre as melhorias propostas para o fork.

## Formatos e exportação

O motor documenta leitura ou escrita de diferentes formatos, com suporte variado: MP4/MOV, Matroska/WebM, AVI, MXF, MPEG, H.264, HEVC, ProRes, VP8/VP9, AV1 (decodificação), AAC, Opus e imagens estáticas. **Nem todo codec disponível para leitura está disponível para exportação.** Em particular, HEVC por hardware e mídia de câmera em 10 bits podem exigir configurações específicas.

Leia [compatibilidade de codecs](docs/codec-parity.md), [formatos](docs/file-format-parity.md) e [aceleração por hardware](docs/hardware-parity.md).

## Agentes e automação MCP

O projeto dispõe de um servidor MCP integrado à ferramenta `filmcraft-cli`, que permite listar comandos, inspecionar projetos, importar mídias, modificar a edição e renderizar quadros.

Exemplo de modo sem interface:

```powershell
./target/release/filmcraft-cli.exe mcp --demo
```

O modo de controle da interface desktop utiliza uma porta local e **token de autenticação**. Consulte [Agentes](docs/agents.md) e [Protocolo de controle](docs/control-protocol.md) antes de habilitá-lo. Não publique tokens nem abra a porta de controle para a internet.

Futuramente, o fork WMK poderá oferecer agentes para transcrever, sugerir cortes, organizar cenas e exportar projetos, com confirmação e histórico das alterações.

## Arquitetura

| Diretório | Responsabilidade |
| --- | --- |
| `apps/filmcraft` | Aplicativo de desktop |
| `apps/filmcraft-cli` | Interface de linha de comando e MCP |
| `apps/filmcraft-web` | Variante para navegador |
| `crates/ui-egui` | Interface gráfica e tradução |
| `crates/engine` | Sessão e execução dos comandos |
| `crates/edit` | Operações de edição na timeline |
| `crates/render` e `crates/gpu` | Renderização e composição |
| `crates/audio-dsp` | Áudio e processamento digital de sinais |
| `crates/captions`, `crates/speech`, `crates/tts` | Legendas, transcrição e narração |
| `crates/export` | Exportação de mídia |
| `crates/automation` | Integração de automação |

Mais informações em [Arquitetura](docs/architecture.md), [Testes](docs/testing.md), [Roadmap original](ROADMAP.md) e [Lacunas conhecidas](docs/gaps.md).

## Limitações atuais e melhorias WMK

O projeto original ainda documenta limitações de estabilidade em alguns computadores, integração com plugins, aceleração por hardware e compatibilidade de mídias reais. As prioridades para o fork WMK são:

1. **Compilação Windows reproduzível:** ZIP portátil e testes básicos de abertura, importação e exportação.
2. **Identidade WMK:** logo aprovada, ícones de sistema e tela Sobre, preservando atribuições.
3. **Português brasileiro:** revisão do catálogo, mensagens de erro e documentação para iniciantes.
4. **Modo econômico:** detecção de GPU, configuração de cache, proxies e prévias leves.
5. **IA com controle:** painel de provedores, ferramentas MCP, segurança e registro das operações.
6. **Qualidade:** testes de arquivos reais, relatórios de falha e verificação de desempenho.

Este roteiro é proposto para estudos e pode mudar conforme os resultados de compilação e teste.

## Créditos e licenças

O **WMK Film Studio** é um fork de **[FilmCraft](https://github.com/storytold/filmcraft)**, mantido originalmente pelo time ArtCraft e seus colaboradores. O código-base é oferecido sob **MIT OU Apache-2.0**, conforme os arquivos [LICENSE-MIT](LICENSE-MIT) e [LICENSE-APACHE](LICENSE-APACHE). As atribuições de código, fontes e materiais estão em [NOTICE](NOTICE) e [ATTRIBUTION.md](ATTRIBUTION.md).

**Identidade e manutenção WMK:** Walney Moreira Klein — walneyk@hotmail.com.

As marcas ArtCraft/FilmCraft dos autores originais não devem ser apresentadas como se fossem de propriedade da WMK. Créditos e avisos legais devem ser preservados em distribuições derivadas.


## Documentação WMK e acompanhamento

- [Índice dos manuais em português](manuais/README.md)
- [Primeiros passos](manuais/01-primeiros-passos.md)
- [Edição, áudio e exportação](manuais/02-editor-e-exportacao.md)
- [Desenvolvimento, compilação e manutenção](manuais/03-desenvolvimento.md)
- [Roadmap interativo](roadmap.html) — consulte fases, progresso e critérios de conclusão.
- [Ferramentas WMK para Windows](manuais/04-ferramentas-wmk.md) — diagnóstico de hardware e estrutura de pastas de projetos.

O roadmap é um arquivo HTML estático. A seleção de filtros e as anotações locais ficam no navegador, não alteram o repositório. Alterações oficiais de status devem ser feitas em commits.

### Início da evolução v0.20.2

As propostas de Project Manager, Workspace Manager, Video Enhancer, Subtitle Studio, Audio Lab, Motion Graphics, Screen Recorder, Batch Processor, Proxy Manager, AI Editor, Asset Library e Learning Studio estão registradas no [roadmap](roadmap.html). A primeira entrega de código dessa fase inclui dois **utilitários independentes do editor**: `scripts/WMK-Diagnostico.ps1` e `scripts/WMK-Novo-Projeto.ps1`. Consulte o [manual específico](manuais/04-ferramentas-wmk.md). Não confunda essas ferramentas com recursos integrados à interface.
