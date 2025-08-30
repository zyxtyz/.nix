 { inputs, config, lib, pkgs, ... }:
 {
 	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
             "spotify"
           ];

 	programs.spicetify = 
	 let
	 	spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
 	 in
	    {
		enable =  lib.mkForce true;
		enabledExtensions = [
	 		spicePkgs.extensions.adblock
	 		spicePkgs.extensions.hidePodcasts
			spicePkgs.extensions.loopyLoop
			spicePkgs.extensions.powerBar
			spicePkgs.extensions.copyToClipboard
			spicePkgs.extensions.volumePercentage
			spicePkgs.extensions.fullAppDisplay
			{
					 name = "nightcore.js";
				 	 src = ./extensions;
				         appendName = true;
			}

	 		];

			
	};
 }
