 { settings, pkgs, config, ... }:

{
	home-manager.users.${settings.userName} = {
		programs.kitty.enable = true;
		programs.kitty = {
			extraConfig = ''
				font_size 10
				bell no
				map ctrl+shift+c copy_to_clipboard
				map ctrl+shift+v paste_from_clipboard

				'';
		};
	};
}
