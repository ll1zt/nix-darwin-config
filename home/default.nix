{ config, pkgs, username, ... }:

{
    imports = [
        ./programs.nix
        ./shell.nix
        ./git.nix
        ./yabai.nix
        #./rime-squirrel.nix
    ];

    home = {
        username = username;
        homeDirectory = "/Users/${username}";
        stateVersion = "23.11";
    };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}