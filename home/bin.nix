
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "oz" (builtins.readFile ./oz.sh))
  ];

  # ... 你的其他 Home Manager 配置 ...
}
