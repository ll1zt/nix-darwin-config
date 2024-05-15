{ pkgs, ... }: 

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
      # TODO Feel free to add your favorite apps here.

      #Xcode = 497799835;
      #Wechat = 836500024;
      # NeteaseCloudMusic = 944848654;
      #QQ = 451108668;
      # WeCom = 1189898970;  # Wechat for Work
      # TecentMetting = 1484048379;
      # QQMusic = 595615424;
      LocalSend = 1661733229;
      Bob = 1630034110;
    };

    taps = [
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
      #"mrkai77/tap"   
      "koekeishiya/formulae"
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      #"wget" # download tool
      #"curl" # no not install curl via nixpkgs, it's not working well on macOS!
      #"aria2" # download tool
      #"httpie" # http client
      "yabai"
      "skhd"
      ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      #"arc"
      "wechat"
      "qq"
      "brave-browser"
      "visual-studio-code"
      #"alfred"
      "hiddenbar"
      "ticktick"
      #"karabiner-elements"
      "picgo"
      "raycast"
      #"loop"
      "appcleaner"
      "keka"
      "aldente"
      # IM & audio & remote desktop & meeting
      #"telegram"
      #"discord"
      "dingtalk"
      "obsidian"
      "calibre" # ebook manager
      "parsec" # remote desktop
      "command-x"
      "Itsycal"
      "squirrel"
      "karabiner-elements"
      #"anki"
      #"iina" # video player
      #"raycast" # (HotKey: alt/option + space)search, caculate and run scripts(with many plugins)
      "stats" # beautiful system monitor
      #"eudic" # 欧路词典
      # Development
      #"insomnia" # REST client
      #"wireshark" # network analyzer
    ];
  };
}
