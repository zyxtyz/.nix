 { pkgs, settings, config, lib, ... }:
let
  theme = import ./colorSchemes.nix {};
  wallpaper = builtins.elemAt theme.${settings.theme}.wallpapers 0;
  in
{
	stylix = {
		autoEnable = true;
		enable = true;
		base16Scheme = theme.${settings.theme}.colorScheme;
	        fonts = {
    			serif = {
      				package = pkgs.texlivePackages.gnu-freefont;
      				name = "gnu free font aagain (until i find another :] )";
    			};

    			sansSerif = {
      				package = pkgs.nerd-fonts.comic-shanns-mono;
      				name = "comic shanns mono";
    			};

    			monospace = {
      				package = pkgs.texlivePackages.gnu-freefont;
      				name = "gnu-free-font";
    			};

    			emoji = {
      				package = pkgs.nerd-fonts.symbols-only;
      				name = "Nerd Font Symbols";
    			};
  		};
	 };

	home-manager.users.${settings.userName} = {
		services.wpaperd = {
	 		enable = true;
		 	settings = {
		 		${settings.monitor.name} = {
		 			path = "${settings.homeDirectory}/.nix/wallpapers/${wallpaper}";

		 		};
		 	};
		};
		
	};
}
