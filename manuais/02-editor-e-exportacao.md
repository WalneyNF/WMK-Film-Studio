# Manual 02 — Edição, áudio, legendas e exportação

## 1. Organização de projetos
Crie uma pasta para cada produção: `projeto/entrada`, `projeto/audio`, `projeto/imagens`, `projeto/exports` e `projeto/backup`. Guarde os originais; não trabalhe sobre a única cópia.

A timeline usa **faixas** de vídeo e áudio. Use nomes de faixas consistentes; separe narração, música e efeitos sonoros. Salve versões sucessivas ao fazer grandes alterações.

## 2. Edição básica
- **Entrada/Saída (In/Out):** define o intervalo de origem que deseja utilizar.
- **Inserir/Overwrite:** posiciona mídia com ou sem sobrescrever conteúdo conforme o modo.
- **Razor/Corte:** divide clipes; use o histórico/undo para reverter.
- **Ripple:** altera o corte e desloca material subsequente.
- **Roll/Slip/Slide:** ajustam limites ou conteúdo preservando relações diferentes entre clipes.
- **Marcadores:** registram pontos de revisão e observações.

**Prática:** importe três clipes, monte uma sequência com 45 segundos, insira uma dissolução e verifique os pontos de corte quadro a quadro.

## 3. Efeitos e quadros-chave
Posição, escala, rotação e opacidade podem ser animadas por quadros-chave. Use transições moderadas e revise a prévia na taxa de quadros final. Os catálogos de efeitos não garantem equivalência exata a outros editores.

**Prática:** anime uma imagem da escala 100% até 108% com aceleração suave e compare a reprodução com o render exportado.

## 4. Áudio
O projeto-base inclui mixer, filtros, equalização, reverberação, tratamento de ganho e medidores LUFS. Confira se picos não clipam; mantenha a narração inteligível acima da música. A meta exata de loudness depende da plataforma de entrega.

**Prática:** narração no canal A1, música em A2 e automação de volume nos trechos com fala.

## 5. Legendas
Use faixas de legenda e importação/exportação SRT ou WebVTT quando disponíveis na versão testada. Revise acentuação, quebras, duração e sincronização. Transcrição por Whisper depende de compilação com feature opcional e modelos; não pressupõe que esteja habilitada no ZIP.

## 6. Exportação
Para um primeiro teste simples: formato MP4, codec H.264, tamanho 1280×720, taxa de quadros compatível com a sequência e áudio AAC. Para 1080p/4K, valide desempenho, suporte da GPU e espaço livre. HEVC pode depender de hardware.

**Critérios de aprovação:** arquivo reproduz do início ao fim; duração e enquadramento corretos; áudio sincronizado; sem telas pretas ou frames congelados; legendas legíveis.

## 7. Checklist de aceitação
- [ ] Projeto criado e salvo
- [ ] Vídeo e áudio importados
- [ ] Edição e transição testadas
- [ ] Projeto reaberto sem perda de mídia
- [ ] MP4 exportado e conferido em reprodutor independente
- [ ] Logs revisados em caso de falha

Leia [docs/testing.md](../docs/testing.md), [docs/file-format-parity.md](../docs/file-format-parity.md) e [docs/codec-parity.md](../docs/codec-parity.md) para detalhes técnicos.
