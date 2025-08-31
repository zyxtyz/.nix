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

		
		
			 enabledExtensions = with spicePkgs.extensions; [
	 			 adblock
	 			 hidePodcasts
				 loopyLoop
				 fullAppDisplay
				 bestMoment
				 allOfArtist
				 {
					 	 name = "nightcore.js";
				 	 	 src = ./extensions;
				        	 appendName = true;
				 }

	 		];

			
	};
 }
