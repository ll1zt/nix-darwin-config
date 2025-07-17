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
    uv
    helix
    maven
    typescript
    typescript-language-server
    rclone
    pyright
    markdown-oxide
    ltex-ls
    nb
    bat
    socat
    pandoc
    ripgrep
    tig
    w3m
    prettier
    taplo
    marksman
    yaml-language-server
    # nodePackages.npm
    yarn
        
  ];
  environment.variables.EDITOR = "hx";

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
      "mocki-toki/formulae"
      "nikitabobko/tap"
      /* "romkatv/powerlevel10k" */
    ];

    # `brew install`
    brews = [
      
      "gnu-tar"
      "fd" #for searching files
      "ripgrep" # for searching files
      #"node"
      "fzf" # for fuzzy search
      "bat" # for syntax highlighting
      "the_silver_searcher" #for
      "perl" # for
      "universal-ctags"
      #"uv" # a library for writing networked applications
      "zk" # a command-line note-taking tool
      "jannis-baum/tap/vivify"
      "octave" # a high-level language for numerical computations
      "swiftlint" #a tool to enforce Swift style and conventions
      "swift-format" # a tool to format Swift code
      "pytorch"
      "rust"
      "opencv"
      "mysql"
      /* "romkatv/powerlevel10k/powerlevel10k" #theme for zsh */
      /* echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc */
      ];

    # `brew install --cask`
    casks = [
      "dingtalk" # Teamwork app by Alibaba Group
      "qq" # messaging tool
      "wechat" # messaging tool

      "anki"
      "anaconda"
      "brave-browser"
      "bitwarden"
      "bleunlock"
      "calibre" # ebook manager
      "charles"
      "corretto@11"
      #"chatgpt" # AI chatbot
      "chatwise"
      "Cryptomator"
      "dropbox"
      "folo"
      "Ghostty"
      /* "cherry-studio" */
      "macfuse"
      "barik"
      "aerospace"
      "obsidian" # Knowledge base --markdown
      "orbstack" # a lightweight virtualization tool
      "pronotes"
      "spotify" # Music streaming service
      "visual-studio-code" # Open-source code editor
      "vivaldi" # Web browser
      "vlc" # Media player
      "zed" # a fully offline note-taking app

      "aldente" # tool to limit maximum charging percentage
      "appcleaner" # Application uninstaller
      /* "crossover" # Run Windows apps on macOS */
      "command-x" # Cut and paste files in Finder
      "hiddenbar" # Utility to hide menu bar items
      "Itsycal" # Menu bar calendar
      "karabiner-elements" # Keyboard customiser
      "keka" # File archiver
      "keycastr"
      "koodo-reader" # a free and open-source eBook reader
      "lulu" # firewall to block unknown outgoing connections
      "plistedit-pro" # Property list and JSON editor
      "raycast" # Control your tools with a few keystrokes
      "squirrel" # Rime input method engine
      "stats" # beautiful system monitor
      "termius" # SSH client
      "miniconda"

      /* "wireshark" */
    ];
  };
}
