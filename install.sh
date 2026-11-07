#!/bin/sh
# codebase komutunu ~/.local/bin altına bağlar ve gerekirse PATH'e ekler.
set -e
DIR=$(cd "$(dirname "$0")" && pwd)
BIN="$HOME/.local/bin"

chmod +x "$DIR/codebase"
mkdir -p "$BIN"
ln -sf "$DIR/codebase" "$BIN/codebase"
echo "Bağlandı: $BIN/codebase -> $DIR/codebase"

case ":$PATH:" in
    *":$BIN:"*) echo "Hazır, 'codebase' yazarak kullanabilirsin." ;;
    *)
        LINE='export PATH="$HOME/.local/bin:$PATH"'
        for RC in "$HOME/.bashrc" "$HOME/.zshrc"; do
            if [ -f "$RC" ] && ! grep -qs '.local/bin' "$RC"; then
                echo "$LINE" >> "$RC"
                echo "PATH satırı eklendi: $RC"
            fi
        done
        echo "Yeni bir terminal aç ya da 'source ~/.bashrc' çalıştır."
        ;;
esac
