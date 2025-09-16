{ config, pkgs, lib, settings, ... }:

{
  home-manager.users.${settings.userName} = {
    wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [ "${settings.monitor.name}, ${settings.monitor.resolution}@${settings.monitor.hz}, 0x0, ${settings.monitor.scale}" ];

      exec-once = [
        "wpaperd"
	"mpd"
	];

      general = {
        gaps_in = 6;
        gaps_out = 20;
        border_size = 0;   
	};

      decoration = {
        rounding = 5;
        active_opacity = "1.0";
        inactive_opacity = "1.0";
        fullscreen_opacity = "1.0";
        #blur = {
					#  xray = false;
					#  passes = 4;
					#  size = 1;
					#};
	

	};

      misc = {
        disable_hyprland_logo = true;
      };

      
        "$mod" = "SUPER";
        "$browser" = "${settings.browser}";
        "$term" = "${settings.terminal}";
        "$filemanager" = "kitty zsh -c \"xplr\"";
      source = [
		
      ];

      bind = [
        " $mod, Return, exec, $term"
        " $mod, R, exec, $menu"
        " $mod, B, exec, $browser"
        " $mod, K, killactive,"
        " $mod, F, fullscreen,"
        " $mod, D, exec, vesktop"
	" CONTROL SHIFT, M, exec, spotify"
        " $mod SHIFT, S, exec, hyprshot -z s --clipboard-only -m region"
        " $mod, N, exec, $filemanager"
        " $mod, DELETE, exit,"
	" $mod, TAB, exec, swaync-client -t"
        " $mod, V, togglefloating,"
        " $mod, Left, movefocus, l"
        " $mod, Right, movefocus, r"
        " $mod, Up, movefocus, u"
        " $mod, Down, movefocus, d"
        " $mod, 1, workspace, 1"
        " $mod, 2, workspace, 2"
        " $mod, 3, workspace, 3"
        " $mod, 4, workspace, 4"
        " $mod, 5, workspace, 5"
        " $mod, 6, workspace, 6"
        " $mod, 7, workspace, 7"
        " $mod, 8, workspace, 8"
        " $mod, 9, workspace, 9"
        " $mod, 0, workspace, 10"
        " $mod SHIFT, 1, movetoworkspace, 1"
        " $mod SHIFT, 2, movetoworkspace, 2"
        " $mod SHIFT, 3, movetoworkspace, 3"
        " $mod SHIFT, 4, movetoworkspace, 4"
        " $mod SHIFT, 5, movetoworkspace, 5"
        " $mod SHIFT, 6, movetoworkspace, 6"
        " $mod SHIFT, 7, movetoworkspace, 7"
        " $mod SHIFT, 8, movetoworkspace, 8"
        " $mod SHIFT, 9, movetoworkspace, 9"
        " $mod SHIFT, 0, movetoworkspace, 10"
      ];
      binde = [
	" , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
	" , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
	};
  };
 };


}
