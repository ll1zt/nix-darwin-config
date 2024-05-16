{ pkgs, ... }:

let
  rime-data = pkgs.fetchFromGitHub {
    owner = "ll1zt";
    repo = "Rime";
    rev = "main"; 
    sha256 = "0000000000000000000000000000000000000000000000000000"; # 这里需要填入正确的哈希值
  };
in
{
  home.file."Library/Rime" = {
    source = rime-data;
    recursive = true;
    force = true;
  };
}
