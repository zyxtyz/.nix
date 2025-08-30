{ inputs, pkgs, settings, ... }:

{

	imports = [
	./configuration.nix
	];
	environment.systemPackages = with pkgs; [
		hyprshot
		
	];

	nix.settings = {
    		substituters = [ "https://hyprland.cachix.org" ];
    		trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  	};

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	
		package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
	};
	
	home-manager.users.${settings.userName} = {

		wayland.windowManager.hyprland = {
			enable = true;
			portalPackage = pkgs.xdg-desktop-portal-hyprland;
		        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
};
};
}
