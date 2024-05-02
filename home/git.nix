{ lib, username, useremail, ...}:

{
    home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

  programs.git = {
    enable = true;
    userName = username;
    userEmail = useremail;
  }  
}
