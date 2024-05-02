{ lib, username, useremail, ...}:

{
    home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

  services.git-daemon = {
    enable = true;
    port = 443;
  };

  programs.git = {
    enable = true;
    userName = username;
    userEmail = useremail;
  }  
}
