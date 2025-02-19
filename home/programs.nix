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

    zsh = {
      enable = true;
      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.zsh-autosuggestions;
          file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
        }
        {
          name = "zsh-autocomplete";
          src = pkgs.zsh-autocomplete;
          file = "share/zsh-autocomplete/zsh-autocomplete.zsh";
        }
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.zsh-syntax-highlighting;
          file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
        }
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];
      oh-my-zsh = {
        enable = true;
        plugins = [ 
          "git"
          "web-search"
          "z"
        ];
        theme = "";
        extraConfig = ''
                  # Required for autocomplete with box: https://unix.stackexchange.com/a/778868
                  zstyle ':completion:*' completer _expand _complete _ignored _approximate _expand_alias
                  zstyle ':autocomplete:*' default-context curcontext 
                  zstyle ':autocomplete:*' min-input 0

                  setopt HIST_FIND_NO_DUPS

                  autoload -Uz compinit
                  compinit

                  setopt autocd  # cd without writing 'cd'
                  setopt globdots # show dotfiles in autocomplete list
        '';
      };
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      shellAliases = {
        ll = "ls -l";
      };
      history.size = 10000;
      initExtra = ''
        # Load Oh My Zsh first
        source $ZSH/oh-my-zsh.sh
        
        # Then load Powerlevel10k
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
        
        # Initialize autosuggestions
        ZSH_AUTOSUGGEST_STRATEGY=(history completion)
        bindkey '^ ' autosuggest-accept

        # zsh-autocomplete
        bindkey -M menuselect '^M' .accept-line # run code when selected completion
        
        # 任何你想添加到 .zshrc 末尾的内容
        # ...
        alias -- ll='ls -l'
        alias vim=nvim

        alias ls='ls -lsa'



        alias oo='cd $HOME/Documents/0bsidian/1-Zettelkasten/'
        alias or='vim $HOME/Documents/0bsidian/1-Zettelkasten/inbox/*.md'
        alias pwd="pwd | tee /dev/tty | pbcopy"

      '';

    };
  };  


}
