{
  description = "A NixOS flake for Aws.";

  inputs = {
    hyprland.url = "github:hyprwm/Hyprland"; 
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs.url = "github:/nixos/nixpkgs/nixos-unstable";
    hyprland-contrib.url = "github:hyprwm/contrib";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self , nixpkgs, home-manager, nixos-hardware, ... }@inputs:
let
    inherit (self) outputs;
   in 
  rec {
    overlays = import ./overlays { inherit inputs; };
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home;


    nixosConfigurations = {
      aws = nixpkgs.lib.nixosSystem {    # this is the hostname = some func
        system = "x86_64-linux";
	specialArgs = { inherit inputs outputs; }; # this is the important part
        modules = [./systems/aws ];
      };
    };
    homeConfigurations = {
        aws = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./profiles/aws ];
       }; 
    };
};
}

