# Datagram CLI Runner

Register using https://dashboard.datagram.network?ref=881224553 the follow the below steps.

A simple script to run the Datagram CLI environment quickly without needing to clone or manually set permissions.

## 🚀 Quick Start

- To run the script directly without downloading it manually:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/0xnightwind/datagram_cli_runner/refs/heads/main/datagram_cli_runner.sh)
```

- To detach from tmux session - press CTRL+B then press D

- To attach:
```bash
tmux attach -t datagram
```

- Command to clean up old .db for Linux installs:
```bash
rm -rf ~/.datagram/ai-router/.db
```
