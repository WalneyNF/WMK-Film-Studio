# Manual 04 — Ferramentas WMK para Windows (primeiros módulos da v0.20.2)

Estas ferramentas PowerShell funcionam fora da interface do editor. Elas **não alteram o motor de vídeo**, não modificam o Registro do Windows e não substituem o arquivo de projeto nativo `.fcproj`.

## 1. Diagnóstico de hardware

Execute PowerShell na pasta do repositório:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\WMK-Diagnostico.ps1 -PastaAplicativo "D:\Ferramentas\WMK-Film-Studio"
```

O script salva `WMK-Diagnostico.json` com versão e arquitetura do Windows, modelo da CPU, GPUs, versões de drivers, memória reportada e presença do executável. O campo de memória da GPU é estimado a partir do WMI, que pode limitar o valor relatado. O script **não avalia compatibilidade gráfica por si só** e não lê arquivos de vídeo nem chaves de IA.

Para salvar em local diferente use `-Saida "D:\manuais\diagnostico.json"`. Revise o JSON antes de enviar publicamente: modelos de hardware e características do sistema podem identificar seu equipamento.

## 2. Criar estrutura de pastas de projeto

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\WMK-Novo-Projeto.ps1 -Nome "Documentario teste" -Destino "D:\Videos" -Preset 1080p
```

O utilitário cria, sem sobrescrever nomes existentes:

```text
Documentario teste/
  01-originais/
  02-audio/
  03-imagens/
  04-projetos/
  05-proxies/
  06-exportacoes/
  07-backups/
  08-relatorios/
  wmk-projeto.json
```

A estrutura é apenas uma organização de diretórios. **Não cria arquivos `.fcproj` válidos** nem muda o projeto aberto no editor. Depois de criar a pasta, abra o WMK Film Studio, crie seu projeto normalmente e salve-o em `04-projetos`.

## 3. Testes
No Windows, execute o criador com um destino temporário. Verifique todas as pastas e o manifesto; rode novamente com o mesmo nome e confirme que ele não sobrescreve nada. Para o diagnóstico, confira se o JSON é válido e se o parâmetro de saída é respeitado.

Os scripts estão previstos para verificação automática no workflow Windows. Seu estado só será considerado concluído no roadmap após os testes.
