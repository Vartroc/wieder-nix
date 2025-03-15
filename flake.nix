{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:sodiboo/niri-flake";
    # ghostty.url = "github:ghostty-org/ghostty";
    stylix.url = "github:danth/stylix";
    nimmer.url = "github:vartroc/nimmer";
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};
    in
    {
      nixosConfigurations.Gartroc = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit pkgs-stable;
        };
        modules = [
          ./hosts/Gartroc/configuration.nix
          inputs.home-manager.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
          inputs.nixvim.nixosModules.nixvim
          inputs.niri.nixosModules.niri
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
}
