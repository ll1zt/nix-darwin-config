{ config, pkgs, ... }:

{
  home.activation.copyRimeConfig = {
    before = [ "linkGeneration" ];  # 确保在链接生成之前执行
    text = ''
      # 设定临时目录
      tempDir="/tmp/rime-config";

      # 确保目标目录存在
      mkdir -p "$HOME/Library/Rime";

      # 如果已经存在配置，可以选择备份或删除
      if [ -d "$HOME/Library/Rime" ]; then
        rm -rf "$HOME/Library/Rime"/*;
      fi

      # 克隆Git仓库
      git clone https://github.com/ll1zt/Rime "$tempDir";

      # 复制文件
      cp -r "$tempDir"/* "$HOME/Library/Rime/";

      # 清理临时目录
      rm -rf "$tempDir";
    '';
  };
}
