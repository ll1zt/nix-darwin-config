
#!/bin/zsh

# 检查 zk 命令是否存在
if ! command -v zk &> /dev/null; then
  echo "Error: zk command not found. Please install zk."
  exit 1
fi

# 获取可选的标题参数
title="$1"

# 构建 zk 命令
zk_command="zk new"
if [ -n "$title" ]; then
  zk_command+=" --title \"$title\""
fi

# 切换到 Zettelkasten 目录 (更安全的方式)
zk_dir="/Users/lllzt/Documents/0bsidian/1-Zettelkasten/inbox/"
if [ ! -d "$zk_dir" ]; then
  echo "Error: Zettelkasten directory '$zk_dir' not found."
  exit 1
fi
cd "$zk_dir" || exit 1

# 执行 zk 命令
$zk_command
