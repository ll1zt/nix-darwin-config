{
  description = "Darwin configuration";

  nixConfig = {
    substituters = [
      # Query the mirror of USTC first, and then the official cache.
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };

  inputs = {
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    /* nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin"; */

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
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

          }
        ];
      };
    };

    # nix code formatter
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
