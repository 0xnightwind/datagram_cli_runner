#!/bin/bash

# updates and upgrades local packages + installs a few commonly used packages used by CLI nodes
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl iptables build-essential git wget jq make gcc nano tmux htop nvme-cli pkg-config libssl-dev libleveldb-dev tar clang

# download the datagram CLI
wget https://github.com/Datagram-Group/datagram-cli-release/releases/latest/download/datagram-cli-x86_64-linux -O datagram
sudo chmod +x datagram

# move it to /usr/local/bin/ and make it executable
sudo mv datagram /usr/local/bin/datagram
sudo chmod +x /usr/local/bin/datagram

# check for any existing session
tmux has-session -t datagram 2>/dev/null
if [ $? -eq 0 ]; then
  echo "A tmux session named 'datagram' already exists. Killing it..."
  tmux kill-session -t datagram
fi

# create a new tmux session
tmux new -s datagram -d

# 5) ask for the key
echo "Please enter your Datagram License key (find it at https://dashboard.datagram.network/wallet?tab=licenses): "
read API_KEY

# 5) run the cli
tmux send-keys -t datagram "datagram run -- -key $API_KEY" C-m

echo
echo "✅ Datagram is installed and running inside a tmux session named 'datagram'."
echo "➡️  To view the session, run: tmux attach -t datagram"
echo "↩️  Inside tmux: press CTRL+B then D to detach safely."
echo
read -n 1 -s -r -p "Press any key to exit this script..."
