{
  description = "A NixOS flake for Aws.";

  inputs = {
    nixos-hardware.url = "github:nixos/nixos-hardware";
    stable.url = "github:/nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-contrib.url = "github:hyprwm/contrib";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self , nixpkgs, stable, home-manager, hyprland, nixos-hardware, ... }@inputs: 
  {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home;

    nixosConfigurations = {
      aws = nixpkgs.lib.nixosSystem {    
        system = "x86_64-linux";
	specialArgs = { inherit inputs ; }; # this is the important part
        modules = [ 
	            ./hosts/aws 
		    home-manager.nixosModules.home-manager
                       {
                          home-manager.useGlobalPkgs = true;
                          home-manager.useUserPackages = true;
                          home-manager.users.aws = import ./profiles/aws;
			  home-manager.extraSpecialArgs = {inherit inputs;};
			}
	          ];
    };
aws-lappy = nixpkgs.lib.nixosSystem {    
        system = "x86_64-linux";
	specialArgs = { inherit inputs ; }; # this is the important part
        modules = [ 
                    ./hosts/aws-lappy 
                    home-manager.nixosModules.home-manager
                       {
                          home-manager.useGlobalPkgs = true;
                          home-manager.useUserPackages = true;
                          home-manager.users.aws = import ./profiles/aws-lappy;
                          home-manager.extraSpecialArgs = {inherit inputs ;};
                        }
                  ];
    };

   };
 };
}
