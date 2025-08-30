 { settings, pkgs, config, ... }:

{
	home-manager.users.${settings.userName} = {
		programs.kitty.enable = true;
		programs.kitty = {
			extraConfig = ''
			      #  background_opacity 0.7
				font_family FiraCode Nerd Font
				font_size 10.0
				enable_ligatures yes
				bell no
				map ctrl+shift+c copy_to_clipboard
				map ctrl+shift+v paste_from_clipboard

				'';
		};
	};
}
