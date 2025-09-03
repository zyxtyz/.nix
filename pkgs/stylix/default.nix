 { pkgs, settings, config, ... }:
let
  theme = import ./colorSchemes.nix {};
  wallpaper = builtins.elemAt theme.${settings.theme}.wallpapers ${settings.wallpaperNumber};
  in
{
	stylix = {
		autoEnable = true;
		enable = true;
		 	base16Scheme = theme.${settings.theme}.colorScheme;
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
