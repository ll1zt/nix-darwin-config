{ pkgs, lib, ... }:

let
  rime-data = builtins.fetchGit {
    url = "https://github.com/ll1zt/Rime";
    ref = "main";
  };
in
{
  home.file."Library/Rime" = {
    source = rime-data;
    recursive = true;
    force = true;
  };
}
