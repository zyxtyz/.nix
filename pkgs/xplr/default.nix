 { pkgs, settings, ... }:
 {
	home-manager.users.${settings.userName} = {
	 	programs.xplr = {
	 		enable = true;
		};
	 };
 }
