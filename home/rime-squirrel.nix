{ pkgs, ... }:

let
  rime-data = pkgs.fetchFromGitHub {
    owner = "ll1zt";
    repo = "Rime";
    rev = "main"; 
    sha256 = "1fym7w9rh2wnq67pnxyp9znnl8cckcvj0c22b7rwwy7b2jmg0hxi";# 这里需要填入正确的哈希值
  };
in
{
  home.file."Library/Rime" = {
    source = rime-data;
    recursive = true;
    force = true;
  };
}
