{ config, pkgs, username, ... }:

{
    imports = [
        ./programs.nix
        /* ./shell.nix */
        /* ./bin.nix */
        ./git.nix
        ./yabai.nix
        ./yazi.nix
        # ./packages.nix
        /* /rime-squirrel.nix */
    ];

    home = {
        username = username;
        homeDirectory = "/Users/${username}";
        stateVersion = "25.11";
    };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
