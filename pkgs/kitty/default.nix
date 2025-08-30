 { settings, pkgs, config, ... }:
 
 { 
	 imports = [./configuration.nix ];
	 environment.systemPackages = [ pkgs.kitty ];
 }
