# GhostInvoke

**GhostInvoke** é um projeto educacional que demonstra como utilizar técnicas de evasão de EDR (Endpoint Detection and Response) utilizando execução *fileless* via LOLBins (Living Off The Land Binaries). Este projeto é voltado para estudo e pesquisa em ambientes controlados.

## 🚨 Aviso
> Este projeto é apenas para fins educacionais. **Não use em ambientes de produção ou contra alvos sem autorização.** O autor não se responsabiliza por qualquer uso indevido.

---

## 🔍 O que é feito aqui?

- Utilização de LOLBins como `regsvr32.exe` e `InstallUtil.exe`
- Execução de shellcode diretamente na memória (fileless)
- Simulação de evasão básica de EDR
- Execução de payload simulado (ex: calc.exe)

---

## 🧠 Técnicas envolvidas

- **LOLBin abuse** (`regsvr32`, `InstallUtil`)
- **Injeção de shellcode com PowerShell**
- **Obfuscação leve**
- **Execução na memória sem tocar o disco**

---

## 🛠️ Como rodar (em ambiente controlado)

1. Abra o PowerShell como administrador
2. Execute:
```powershell
.\ghostinvoke.ps1
```

> Para simular o uso de LOLBin, você pode renomear e chamar o script através de um dos binários do Windows usados como LOLBin.

---

## 📂 Estrutura

- `ghostinvoke.ps1`: script principal de execução fileless
- `invoke-shellcode.ps1`: função de injeção de shellcode
- `payload.bin`: shellcode simulado (não malicioso)
- `detections/`: exemplos de YARA e análise de resposta de EDR

---

## 📘 Referências

- https://lolbas-project.github.io
- https://attack.mitre.org
- https://redcanary.com/blog
- https://specterops.io

---

