{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    pandoc
  ];

  programs = {
    neovim = {
        enable = true;
        defaultEditor = true;
        # vimAlias = true;
    };

    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    zsh.enable = true; # see note on other shells below

  };
}
