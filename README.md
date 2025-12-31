# NimCr0n
Anonymous and Effective wp-cron DOS using Nim.

# ⚙️ Installations
## Github
```
git clone https://github.com/ncryptsion/nimcr0n.git
```

## Nim
```
nim c -d:ssl -o:nimcr0n index
```

# 🛠️ Setup
In order for Nimcr0n to properly function, you need to ensure Tor is running from port `9080`.

## Linux
```
sudo apt update && sudo apt install tor -y && sudo systemctl start tor
```

## Windows
1. Visit https://www.torproject.org/download/tor/
2. Download the **Tor Expert Bundle**.
3. Run the Tor with HTTPTunnelPort. `tor --HTTPTunnelPort 9080`

# 🚀 Usage
```
nimcr0n <domain> <concurrent>
```

| Argument | Description | Example |
| --- | --- | --- |
| domain | The target website domain. | `nimcr0m example.ph <concurrent>` |
| concurrent | The power or concurrent for Nimcr0n. | `nimcr0m example.ph 100` |

<div align="center">
  <sub>This project is distributed under <a href="/LICENSE"><b>MIT License</b></a></sub>
</div>