{ config, pkgs, lib, ... }:

{
  home.activation.copyRimeConfig = {
    before = [ "linkGeneration" ];  # 确保在链接生成之前执行
    text = let
      # 你可以选择在Nix store中临时存储这个仓库或者直接在家目录下操作
      # 这里使用的是直接在家目录下操作的方式
      tempDir = "/Temporary /rime-config";
    in ''
      # 确保目标目录存在
      mkdir -p $HOME/Library/Rime

      # 如果已经存在配置，可以选择备份或删除
      if [ -d $HOME/Library/Rime ]; then
        rm -rf $HOME/Library/Rime/*
      fi

      # 克隆Git仓库
      git clone https://github.com/ll1zt/Rime ${tempDir}

      # 复制文件
      cp -r ${tempDir}/* $HOME/Library/Rime/

      # 清理临时目录
      rm -rf ${tempDir}
    '';
  };
}
