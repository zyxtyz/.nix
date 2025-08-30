{ config, pkgs, lib, settings, ... }:

{
  home-manager.users.${settings.userName} = {
    wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [ "${settings.monitor.name}, ${settings.monitor.resolution}@${settings.monitor.hz}, 0x0, ${settings.monitor.scale}" ];

      exec-once = [
        "swww-daemon"
	      "mpd"
	];

      general = {
        gaps_in = 6;
        gaps_out = 15;
        border_size = 2;
					# "col.active_border" = "${config.lib.stylix.colors.base03}";
					#   "col.inactive_border" = "${config.lib.stylix.colors.base08}";
      };

      decoration = {
        rounding = 3;
        active_opacity = "1.0";
        inactive_opacity = "1.0";
        fullscreen_opacity = "1.0";
        blur = {
          xray = true;
          passes = 4;
          size = 1;
        };
	

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
	windowrule = [
            # idleinhibit fullscreen for certain classes
            "idleinhibit fullscreen, class:^(.*celluloid.*)$|^(.*mpv.*)$|^(.*vlc.*)$"
            "idleinhibit fullscreen, class:^(.*[Ss]potify.*)$"
            "idleinhibit fullscreen, class:^(.*LibreWolf.*)$|^(.*floorp.*)$|^(.*Brave.*)$|^(.*firefox.*)$|^(.*chromium.*)$|^(.*zen.*)$|^(.*vivaldi.*)$"

            # picture-in-picture window rules
            "float, title:^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
            "keepaspectratio, title:^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
            "move 73% 72%, title:^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
            "size 25%, title:^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
            "pin, title:^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"

            # opacity rules (removed invalid $& symbols)
            "opacity 0.90 0.90 1, class:^(firefox)$"
            "opacity 0.90 0.90 1, class:^(Brave-browser)$"
            "opacity 0.80 0.80 1, class:^(code-oss)$"
            "opacity 0.80 0.80 1, class:^([Cc]ode)$"
            "opacity 0.80 0.80 1, class:^(code-url-handler)$"
            "opacity 0.80 0.80 1, class:^(code-insiders-url-handler)$"
					  "opacity 0.80 0.80 1, class:^(kitty)$"
            "opacity 0.80 0.80 1, class:^(org.kde.dolphin)$"
            "opacity 0.80 0.80 1, class:^(org.kde.ark)$"
            "opacity 0.80 0.80 1, class:^(nwg-look)$"
            "opacity 0.80 0.80 1, class:^(qt5ct)$"
            "opacity 0.80 0.80 1, class:^(qt6ct)$"
            "opacity 0.80 0.80 1, class:^(kvantummanager)$"
            "opacity 0.80 0.70 1, class:^(org.pulseaudio.pavucontrol)$"
            "opacity 0.80 0.70 1, class:^(blueman-manager)$"
            "opacity 0.80 0.70 1, class:^(nm-applet)$"
            "opacity 0.80 0.70 1, class:^(nm-connection-editor)$"
            "opacity 0.80 0.70 1, class:^(org.kde.polkit-kde-authentication-agent-1)$"
            "opacity 0.80 0.70 1, class:^(polkit-gnome-authentication-agent-1)$"
            "opacity 0.80 0.70 1, class:^(org.freedesktop.impl.portal.desktop.gtk)$"
            "opacity 0.80 0.70 1, class:^(org.freedesktop.impl.portal.desktop.hyprland)$"
            "opacity 0.70 0.70 1, class:^([Ss]team)$"
            "opacity 0.70 0.70 1, class:^(steamwebhelper)$"
            "opacity 0.70 0.70 1, class:^([Ss]potify)$"
            "opacity 0.70 0.70 1, initialTitle:^(Spotify Free)$"
            "opacity 0.70 0.70 1, initialTitle:^(Spotify Premium)$"

            # opacity for other classes
            "opacity 0.90 0.90, class:^(com.github.rafostar.Clapper)$"
            "opacity 0.80 0.80, class:^(com.github.tchx84.Flatseal)$"
            "opacity 0.80 0.80, class:^(hu.kramo.Cartridges)$"
            "opacity 0.80 0.80, class:^(com.obsproject.Studio)$"
            "opacity 0.80 0.80, class:^(gnome-boxes)$" # Boxes-Gtk
            "opacity 0.80 0.80, class:^(vesktop)$" # Vesktop
            "opacity 0.80 0.80, class:^(discord)$" # Discord-Electron
            "opacity 0.80 0.80, class:^(WebCord)$" # WebCord-Electron
            "opacity 0.80 0.80, class:^(ArmCord)$" # ArmCord-Electron
            "opacity 0.80 0.80, class:^(app.drey.Warp)$" # Warp-Gtk
            "opacity 0.80 0.80, class:^(net.davidotek.pupgui2)$" # ProtonUp-Qt
            "opacity 0.80 0.80, class:^(yad)$" # Protontricks-Gtk
            "opacity 0.80 0.80, class:^(Signal)$" # Signal-Gtk
            "opacity 0.80 0.80, class:^(io.github.alainm23.planify)$" # planify-Gtk
            "opacity 0.80 0.80, class:^(io.gitlab.theevilskeleton.Upscaler)$" # Upscaler-Gtk
            "opacity 0.80 0.80, class:^(com.github.unrud.VideoDownloader)$" # VideoDownloader-Gtk
            "opacity 0.80 0.80, class:^(io.gitlab.adhami3310.Impression)$" # Impression-Gtk
            "opacity 0.80 0.80, class:^(io.missioncenter.MissionCenter)$" # MissionCenter-Gtk
            "opacity 0.80 0.80, class:^(io.github.flattool.Warehouse)$" # Warehouse-Gtk

            # floating window rules
            "float, class:^(org.kde.dolphin)$, title:^(Progress Dialog — Dolphin)$"
            "float, class:^(org.kde.dolphin)$, title:^(Copying — Dolphin)$"
            "float, title:^(About Mozilla Firefox)$"
            "float, class:^(firefox)$, title:^(Picture-in-Picture)$"
            "float, class:^(firefox)$, title:^(Library)$"
            "float, class:^(kitty)$, title:^(top)$"
            "float, class:^(kitty)$, title:^(btop)$"
            "float, class:^(kitty)$, title:^(htop)$"
            "float, class:^(vlc)$"
            "float, class:^(kvantummanager)$"
            "float, class:^(qt5ct)$"
            "float, class:^(qt6ct)$"
            "float, class:^(nwg-look)$"
            "float, class:^(org.kde.ark)$"
            "float, class:^(org.pulseaudio.pavucontrol)$"
            "float, class:^(blueman-manager)$"
            "float, class:^(nm-applet)$"
            "float, class:^(nm-connection-editor)$"
            "float, class:^(org.kde.polkit-kde-authentication-agent-1)$"

            "float, class:^(Signal)$" # Signal-Gtk
            "float, class:^(com.github.rafostar.Clapper)$" # Clapper-Gtk
            "float, class:^(app.drey.Warp)$" # Warp-Gtk
            "float, class:^(net.davidotek.pupgui2)$" # ProtonUp-Qt
            "float, class:^(yad)$" # Protontricks-Gtk
            "float, class:^(eog)$" # Imageviewer-Gtk
            "float, class:^(io.github.alainm23.planify)$" # planify-Gtk
            "float, class:^(io.gitlab.theevilskeleton.Upscaler)$" # Upscaler-Gtk
            "float, class:^(com.github.unrud.VideoDownloader)$" # VideoDownloader-Gtk
            "float, class:^(io.gitlab.adhami3310.Impression)$" # Impression-Gtk
            "float, class:^(io.missioncenter.MissionCenter)$" # MissionCenter-Gtk

            # common modal dialogs
            "float, title:^(Open)$"
            "float, title:^(Authentication Required)$"
            "float, title:^(Add Folder to Workspace)$"
            "float, initialtitle:^(Open File)$"
            "float, title:^(Choose Files)$"
            "float, title:^(Save As)$"
            "float, title:^(Confirm to replace files)$"
            "float, title:^(File Operation Progress)$"
            "float, class:^([Xx]dg-desktop-portal-gtk)$"
            "float, title:^(File Upload)(.*)$"
            "float, title:^(Choose wallpaper)(.*)$"
	    "float, title:^(Preferences)(.*)$"
            "float, title:^(About)(.*)$"
            "float, title:^(Confirm)(.*)$"
            "float, title:^(Clear Recent Documents)(.*)$"
            "float, title:^(Clear History)(.*)$"
            "float, title:^(Do you want to quit)(.*)$"
            "float, title:^(Quit)(.*)$"
            "float, title:^(Alert)(.*)$"
            "float, title:^(Warning)(.*)$"
            "float, title:^(Confirm Shutdown)(.*)$"
            "float, title:^(Select Color)(.*)$"
            "float, title:^(Font)(.*)$"
            "float, title:^(Back)(.*)$"
            "float, title:^(Run)(.*)$"
            "float, title:^(Restart)(.*)$"
            "float, title:^(Stop)(.*)$"
            "float, title:^(About)(.*)$"
            "float, title:^(Exit)(.*)$"
            "float, title:^(Log Out)(.*)$"
		];
};
  };
 };


}
