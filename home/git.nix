{ lib, username, useremail, ...}:

{
    home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

 #programs.ssh = {
 #  enable = true;
 #  settings = {
 #    Host "github.com" = {
 #      HostName = "ssh.github.com";
 #      User = "git";
 #      Port = 443;
 #    };
 #  };
 #};

  programs.git = {
    enable = true;
    userName = username;
    userEmail = useremail;
  }  
}
