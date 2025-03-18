{ pkgs, lib, ... }: 

{
  environment.systemPackages = with pkgs; [
    neovim
    git
    tree
    just
    neofetch
    wget
    nodejs
  ];
  environment.variables.EDITOR = "nvim";

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    masApps = {
      /* LocalSend = 1661733229; */
      Bob = 1630034110;
      QuantumultX  = 1443988620;
      Infuse = 1136220934;
      # NetNewsWire = 1480640210;
    };

    taps = [
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
      "koekeishiya/formulae"
      "cloud-fs/clouddrive2"
      "mocki-toki/formulae"
      "nikitabobko/tap"
      /* "romkatv/powerlevel10k" */
    ];

    # `brew install`
    brews = [
      "yabai"
      "gnu-tar"
      "fd" #for searching files
      "ripgrep" # for searching files
      "clouddrive2"
      #"node"
      "fzf" # for fuzzy search
      "bat" # for syntax highlighting
      "the_silver_searcher" #for
      "perl" # for
      "universal-ctags"
      "uv" # a library for writing networked applications
      "zk" # a command-line note-taking tool
      "jannis-baum/tap/vivify"
      "octave" # a high-level language for numerical computations
      "swiftlint" #a tool to enforce Swift style and conventions
      "swift-format" # a tool to format Swift code
      /* "romkatv/powerlevel10k/powerlevel10k" #theme for zsh */
      /* echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc */
      ];

    # `brew install --cask`
    casks = [
      "dingtalk" # Teamwork app by Alibaba Group
      "qq" # messaging tool
      "wechat" # messaging tool

      "anki"
      "brave-browser"
      "calibre" # ebook manager
      #"chatgpt" # AI chatbot
      "chatwise"
      "Cryptomator"
      "follow"
      "Ghostty"
      /* "cherry-studio" */
      "intellij-idea-ce" # Java IDE
      "logseq" #
      "macfuse"
      "barik"
      "aerospace"
      "obsidian" # Knowledge base --markdown
      "spotify" # Music streaming service
      "tradingview" # Financial platform
      "trae"
      "ticktick" #To-do & task list manager
      # "visual-studio-code" # Open-source code editor
      "vivaldi" # Web browser
      "vlc" # Media player
      "xmind" # Mind mapping tool
      "zed" # a fully offline note-taking app

      "aldente" # tool to limit maximum charging percentage
      "appcleaner" # Application uninstaller
      /* "crossover" # Run Windows apps on macOS */
      "command-x" # Cut and paste files in Finder
      "hiddenbar" # Utility to hide menu bar items
      "Itsycal" # Menu bar calendar
      "karabiner-elements" # Keyboard customiser
      "keka" # File archiver
      "kindle" # E-book reader
      "lulu" # firewall to block unknown outgoing connections
      "mos"
      "parsec" # remote desktop
      "picgo" # Tool for uploading images
      "plistedit-pro" # Property list and JSON editor
      "raycast" # Control your tools with a few keystrokes
      "squirrel" # Rime input method engine
      "stats" # beautiful system monitor
      "steam" # Gaming platform
      "termius" # SSH client
      /* "wireshark" */
    ];
  };
}
