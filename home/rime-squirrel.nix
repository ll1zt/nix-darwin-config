{ config, pkgs, lib, ... }:

{
  home.activation.copyRimeConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    tempDir="/tmp/rime-config"
  

    # 确保目标目录存在
    run mkdir -p "$HOME/Library/Rime"

    # 如果已经存在配置，可以选择备份或删除
    run rm -rf "$HOME/Library/Rime"/*

    # 克隆Git仓库
    run git clone https://github.com/ll1zt/Rime "$tempDir"

    # 复制文件
    run cp -r "$tempDir"/* "$HOME/Library/Rime"

    # 清理临时目录
    run rm -rf "$tempDir"
  '';
}
