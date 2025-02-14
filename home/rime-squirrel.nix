/* { config, pkgs, lib, username, ... }:

{
  home.activation.copyRimeConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    tempDir="/tmp/rime-config"
  

    # 确保目标目录存在
    run mkdir -p "$HOME/Library/Rime"

    # 如果已经存在配置，可以选择备份或删除
    run rm -rf "$HOME/Library/Rime"/*

    # 克隆Git仓库
    run /etc/profiles/per-user/${username}/bin/git clone https://github.com/ll1zt/Rime "$tempDir"

    # 复制文件
    run cp -r "$tempDir"/* "$HOME/Library/Rime"

    # 清理临时目录
    run rm -rf "$tempDir"
  '';
} */




{ config, pkgs, lib, username, ... }:

let
  rimeConfig = pkgs.stdenv.mkDerivation {
    name = "rime-config";
    src = pkgs.fetchFromGitHub {
      owner = "ll1zt";
      repo = "Rime";
      rev = "main";  # or specific commit hash
      sha256 = "sha256-8hzp2ran0rqixlk37rfdyq4jpnmf3b6a";  # temporary fake hash
    };
    
    installPhase = ''
      mkdir -p $out
      cp -r . $out/
    '';
  };
in
{
  home.file."Library/Rime" = {
    source = rimeConfig;
    recursive = true;
    force = true;
  };
}
