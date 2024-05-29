{ pkgs, lib, ... }: 

{
  environment.systemPackages = with pkgs; [
    neovim
    git
    tree
    just
    neofetch
  ];
  environment.variables.EDITOR = "nvim";

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    masApps = {
      LocalSend = 1661733229;
      Bob = 1630034110;
    };

    taps = [
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
      "koekeishiya/formulae"
    ];

    # `brew install`
    brews = [
      "yabai"
      #"skhd"
      ];

    # `brew install --cask`
    casks = [
      "wechat"
      "qq"
      "visual-studio-code"
      "plistedit-pro"
      "hiddenbar"
      "ticktick"
      "picgo"
      "raycast"
      "appcleaner"
      "keka"
      "aldente"
      "dingtalk"
      "obsidian"
      "calibre" # ebook manager
      "parsec" # remote desktop
      "command-x"
      "Itsycal"
      "squirrel"
      "karabiner-elements"
      "picgo"
      "vivaldi"
      "spotify"
      "stats" # beautiful system monitor
    ];
  };
}
