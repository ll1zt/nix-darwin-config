
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "on" (builtins.readFile ./on.sh))
  ];

  # ... 你的其他 Home Manager 配置 ...
}
