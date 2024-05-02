{ pkgs, lib, ... }: 

{
    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    nixpkgs.config.allowUnfree = true;

    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;

    #services.karabiner-elements.enable = true;
    nix.package = pkgs.nix;


    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 4;

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";

    # do garbage collection weekly to keep disk usage low
    nix.gc = {
        automatic = lib.mkDefault true;
        options = lib.mkDefault "--delete-older-than 7d";
    };

    # Disable auto-optimise-store because of this issue:
    #   https://github.com/NixOS/nix/issues/7273
    # "error: cannot link '/nix/store/.tmp-link-xxxxx-xxxxx' to '/nix/store/.links/xxxx': File exists"
    nix.settings = {
        auto-optimise-store = false;
    };
}