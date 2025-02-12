{ config, pkgs, username, ... }:

{
    imports = [
        ./programs.nix
        ./shell.nix
        ./git.nix
        ./yabai.nix
        ./yazi.nix
        ./kitty.nix
        #./rime-squirrel.nix
    ];

    home = {
        username = username;
        homeDirectory = "/Users/${username}";
        stateVersion = "24,05";
    };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
