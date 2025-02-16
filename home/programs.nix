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
     
      # 正确配置oh-my-zsh（注意连字符）
      oh-my-zsh = {
        enable = true;
        enableCompletion = true;
        plugins = [ 
          "git"
          "web-search"
        ];
        theme = "powerlevel10k/powerlevel10k";
      };

      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.7.0";
            sha256 = "gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
          };
        }
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "0.7.1";
            sha256 = "gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
          };
        }
        {
          name = "powerlevel10k";
          src = pkgs.fetchFromGitHub {
            owner = "romkatv";
            repo = "powerlevel10k";
            rev = "v1.19.0";
            sha256 = "gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
          };
          file = "powerlevel10k.zsh-theme";
        }
      ];

    };
  };  


}
