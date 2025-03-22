{
  description = "Nix for macOS configuration";

  # This is the standard format for flake.nix. `inputs` are the dependencies of the flake,
  # Each item in `inputs` will be passed as a parameter to the `outputs` function after being pulled and built.
  inputs = {
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util.url = "github:hraban/mac-app-util";

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      darwin,
      home-manager,
      nix-index-database,
      mac-app-util,
      ...
    }:
    {
      darwinConfigurations =
        let
          user = "david";
        in
        {
          overlays = import ./overlays {inherit inputs;};

          "david-mbp14" = darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            modules = [
              mac-app-util.darwinModules.default
              ./modules/nix-core.nix
              ./modules/macos.nix
              ./modules/pkgs.nix
              ./modules/dock.nix
              ./modules/homebrew.nix
              nix-index-database.darwinModules.nix-index


              # home manager
              home-manager.darwinModules.home-manager
              {
                home-manager.sharedModules = [
                  mac-app-util.homeManagerModules.default
                  nix-index-database.hmModules.nix-index
                ];
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs; };
                home-manager.users.${user} = import ./home;

              }
            ];
          };
        };
      nix.nixPath = [ "nixpkgs=${inputs.nixpkgs-darwin}" ];
      # nix code formatter
      formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;
    };
}
