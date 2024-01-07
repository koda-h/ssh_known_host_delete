#!/bin/bash

HOME_BIN_DIR="${HOME}/bin"

if [ ! -d "$HOME_BIN_DIR" ]; then
  echo "create ~/bin directory"
  mkdir $HOME_BIN_DIR
fi

# known_hosts自動削除版sshコマンドをコピー
echo "copy ssh file"
cp ssh $HOME_BIN_DIR/ssh

# PATHの設定
if [ "$RET" = "1" ]; then
  if [ "$SHELL" = "/bin/zsh" ]; then
    RC_FILE=.zshrc
  fi
  if [ "$SHELL" = "/bin/bash" ]; then
    RC_FILE=.bashrc
  fi
  echo "set PATH"
  echo 'export PATH="$HOME/bin:$PATH"' >> $HOME/.zshrc
fi

