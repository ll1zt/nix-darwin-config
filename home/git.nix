{ lib, username, useremail, ...}:

{
    home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

  networking.firewall.allowedTCPPorts = [ 443 ];

  programs.openssh = {
    enable = true;
    client = {
      extraConfig = ''
        Host github.com
          Port 443
      '';
    };
  };

  programs.git = {
    enable = true;
    userName = username;
    userEmail = useremail;
  }  
}
