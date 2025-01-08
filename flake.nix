{
  description = "Nix for macOS configuration";

  # This is the standard format for flake.nix. `inputs` are the dependencies of the flake,
  # Each item in `inputs` will be passed as a parameter to the `outputs` function after being pulled and built.
  inputs = {
    # nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      darwin,
      home-manager,
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
              ./modules/nix-core.nix
              ./modules/macos.nix
              ./modules/pkgs.nix
              ./modules/dock.nix
              ./modules/homebrew.nix
              ./modules/trampolines.nix

              # home manager
              home-manager.darwinModules.home-manager
              {
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
