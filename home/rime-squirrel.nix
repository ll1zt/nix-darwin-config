{ pkgs ? import <nixpkgs> {} }:

let
  rimeSrc = pkgs.fetchGit {
    url = "https://github.com/ll1zt/Rime";
    rev = "main"; # 使用最新的 master 分支
  };
in
{
  home.file."Library/Rime" = {
    source = rimeSrc;
    recursive = true;
    force = true;
  };
}
