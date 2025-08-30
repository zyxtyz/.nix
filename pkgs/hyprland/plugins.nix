 { settings, pkgs, config, inputs, }:
{
	environment.systemPackages = with pkgs; [
		hyprlandPlugins.hypr-dynamic-cursors
		comixcursors
	];
	home-manager.users.${settings.userName} = {
		wayland.windowManager.hyprland = {
			plugins = [
				pkgs.hyprlandPlugins.hypr-dynamic-cursors
			];
		settings = {
			plugin.dynamic-cursors = {
				enabled = true;
				 mode = "tilt";
          			threshold = "2";

          			stretch = {
            				limit = "3000";
            				function = "quadratic";
          			};

          			shake = {
           				 enabled = "true";
           				 nearest = "true";
           				 threshold = "6.0";
          				 base = "4.0";
            				 speed = "4.0";
            				 influence = "0.0";
            				 limit = "0.0";
           				 timeout = "2000";
           				 effects = "false";
           				 ipc = "false";
         				 };

         			 hyprcursor = {
          				 nearest = "true";
           				 enabled = "true";
           				 resolution = "-1";
            				 fallback = "clientside";
				};
			};
		};
	};
    };
}
