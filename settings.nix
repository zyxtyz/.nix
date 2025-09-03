 { ... }:
 rec {
        theme = "DarkForest";
	wallpaperNumber = 0;
	 # -----------------------------------------
	fileManager = "xplr";
	homeDirectory = "/home/zyxtyz";
	userName = "zyxtyz";
	hostName = "nixos";
	timeZone = "Europe/Bucharest";
	browser = "zen";
	terminal = "kitty";
	monitor = {
		name = "HDMI-A-1";
		resolution = "1920x1080";
		hz = "75.00";
		scale = "1";
	};
	shell = "zsh";
	pkgs = [
		"hyprland"
		"${terminal}"
		"${shell}"
		"stylix"
		"nixvim"
		"bootloader"
		"mpd"
		"spicetify"
		"swaync"
		"xplr"
	 ];	
	
 }


