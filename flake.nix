{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ 
    self, 
    nixpkgs, 
    home-manager, 
    darwin, 
    ... 
  }: let
    username = "lllzt";
    useremail = "lllzt@pm.me";
    system = "aarch64-darwin";
    hostname = "${username}";
    specialArgs = 
      inputs
    // {
      inherit username useremail hostname;
    };
  in {
    darwinConfigurations = {
      "${hostname}" = darwin.lib.darwinSystem {
        inherit system specialArgs;
        modules = [
          ./modules/nix-core.nix
          ./modules/system.nix
          ./modules/host-users.nix
          ./modules/apps.nix

          home-manager.darwinModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = specialArgs;
              users.${username} = import ./home;
            };



            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
  };
}