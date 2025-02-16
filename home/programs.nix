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
      
      # 正确配置oh-my-zsh（注意连字符）
      oh-my-zsh = {
        enable = true;
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
            sha256 = "1g3pij5qn2j7kd3p13m6qvg146a52rnp5ghq9x3b1pz4chhq7r3d";
          };
        }
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "0.7.1";
            sha256 = "1f75k3kjz4z5s5l1pn3qm2k7fm4qhv4m2dvlx8v5rwvng4agqasf";
          };
        }
        {
          name = "powerlevel10k";
          src = pkgs.fetchFromGitHub {
            owner = "romkatv";
            repo = "powerlevel10k";
            rev = "v1.19.0";
            sha256 = "1g02w7aqdrf7a3y0ad70ry5a1x7d2q0h39zhn7q5xcd5q7m6i4ga";
          };
          file = "powerlevel10k.zsh-theme";
        }
      ];

    };


}
