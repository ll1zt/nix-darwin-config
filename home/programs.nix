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
      enableCompletion = true;
      syntaxHighlighting.enable = true;
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
      '';

      # 正确配置oh-my-zsh（注意连字符）
      oh-my-zsh = {
        enable = true;
        plugins = [ 
          "git"
          "web-search"
        ];
        theme = "";
      };

      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.zsh-autosuggestions;
          file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
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

    };
  };  


}
