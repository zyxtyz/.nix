{
  description = "zyxtyz and notyou's nixos config ";
  

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager.url = "github:nix-community/home-manager";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
	    inputs.nixpkgs.follows = "nixpkgs";
	    url = "github:danth/stylix";
    };
    zen-browser = {
	    url = "github:youwen5/zen-browser-flake";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
	    url = "github:nix-community/nixvim";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
  };
};
  outputs = { self, nixpkgs, home-manager, stylix, nixvim, nixcord, zen-browser, ... }@inputs: 
    let
      system = "x86_64-linux";
      settings = import ./settings.nix { };
      args = {
        inherit system;
        inherit inputs;
        inherit settings;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;	
        specialArgs = args;
        modules = [
          	./src/configuration.nix
          	inputs.home-manager.nixosModules.home-manager
	        inputs.stylix.nixosModules.stylix
	        inputs.nixvim.nixosModules.nixvim
		inputs.spicetify-nix.nixosModules.default

          {
	home-manager = {
	      sharedModules = [
			inputs.nixcord.homeModules.nixcord
		];
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = args;
            
	        };
	      }
      ];
    };
  };
}
