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
  
    kitty = {
        enable = true;
        # kitty has catppuccin theme built-in,
        # all the built-in themes are packaged into an extra package named `kitty-themes`
        # and it's installed by home-manager if `theme` is specified.
        theme = "Catppuccin-Mocha";
        font = {
          name = "JetBrainsMono Nerd Font";
          # use different font size on macOS
          size =
            if pkgs.stdenv.isDarwin
            then 14
            else 13;
        };


        settings = {
          background_opacity = "1";
          macos_option_as_alt = true; # Option key acts as Alt on macOS
          enable_audio_bell = false;
          tab_bar_edge = "top"; # tab bar on top
        };

    };






  };
}
