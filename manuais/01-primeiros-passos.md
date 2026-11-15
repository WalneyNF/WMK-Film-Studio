# Manual 01 — Primeiro contato com o WMK Film Studio

## 1. Finalidade e requisitos
O WMK Film Studio é um editor não linear para criação de vídeos, montagens e projetos audiovisuais. A edição usa uma linha do tempo com várias faixas. A versão pública atual é **experimental** e o funcionamento precisa ser validado em cada PC.

Recomendado para primeiro teste: Windows 64 bits, espaço livre para mídias e exportações, drivers de vídeo atualizados. Para máquinas antigas, comece com vídeos H.264/MP4 de 720p e prefira projetos pequenos.

## 2. Baixar a versão de estudos
1. Acesse [Releases](https://github.com/WalneyNF/WMK-Film-Studio/releases).
2. Abra **WMK Film Studio v0.20.1 — Estudos** e baixe o ZIP Windows x64.
3. Extraia em uma pasta própria, por exemplo `D:\Ferramentas\WMK-Film-Studio`.
4. Execute `WMK-Film-Studio.exe`. O pacote inclui também `filmcraft-cli.exe`.
5. Por não possuir assinatura digital, o Windows pode mostrar um aviso; execute apenas se tiver conferido a origem.

**Atenção:** releases anteriores não recebem automaticamente mudanças do código da branch. A logo nova aparecerá somente em um build feito após a integração destas alterações.

## 3. Idioma pt-BR
Procure **Edit > Language > Português (Brasil)** ou a opção equivalente em **Settings > General**. O catálogo fica em `crates/ui-egui/src/i18n/pt-br.tsv`. Mensagens do motor e comandos de automação ainda podem aparecer em inglês.

## 4. Conhecendo o editor
- **Projeto/Biblioteca de mídias:** reúne vídeos, músicas, imagens e sequências.
- **Monitor de origem:** examina um arquivo antes de adicioná-lo.
- **Monitor do programa:** exibe o resultado da timeline.
- **Timeline:** organiza clipes de vídeo e áudio em faixas.
- **Controles de efeitos:** altera parâmetros e quadros-chave.
- **Exportar:** define formato, resolução, pasta e fila de renderização.

Os painéis podem variar de posição conforme o workspace escolhido.

## 5. Primeiro projeto de teste
1. Crie um projeto vazio e uma sequência.
2. Importe um MP4 curto e coloque o clipe na faixa de vídeo.
3. Reproduza e confira se vídeo e áudio estão sincronizados.
4. Faça um corte no meio e mova o segundo trecho.
5. Salve o projeto no formato nativo `.fcproj`.
6. Exporte MP4/H.264 em 720p e abra o arquivo em outro reprodutor.
7. Feche e reabra o projeto, conferindo caminhos da mídia.

**Exercício:** tente editar um vídeo de 30 segundos com uma imagem de abertura, música e créditos simples.

## 6. Problemas frequentes
| Sintoma | O que verificar |
|---|---|
| Tela preta | Codec do arquivo, driver gráfico, prévia, logs e outros arquivos MP4 |
| Não abre | Driver GPU, modo gráfico seguro se disponível, arquivos de log |
| Reprodução lenta | Resolução de prévia, cache, dimensões da mídia e uso de CPU |
| Sem som | Dispositivo de saída, volume da faixa, mute e mixer |
| Mídia desapareceu | Caminhos dos arquivos de origem e relink |
| Exportação falhou | Espaço em disco, formato, caminho de saída e logs |

Registre o problema com passos reproduzíveis e mídia de teste não confidencial. Não publique vídeos pessoais nem tokens de IA em relatórios públicos.
