 { ... }:
 rec {
	
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
	widgetsDir = "../qs";
	scriptsDir = "/home/zyxtyz/.zyxtyz/pkgs/scripts";
	cursor = "pkgs.comixcursors";
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
	
	
