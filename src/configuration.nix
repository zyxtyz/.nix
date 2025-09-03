
{ config, lib, pkgs, settings, inputs, ... }:
let
	path = pkg: ../pkgs/${pkg}/default.nix;
in
{
  imports =
    [ 
      ./hardware-configuration.nix
    ] ++ map path settings.pkgs;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  programs.hyprland.enable = true;
  users.users.${settings.userName} = {
	isNormalUser = true;
	home = "${settings.homeDirectory}";
	extraGroups = [ "wheel" "networkmanager" "video"  ];
	
};
  nixpkgs.config = {
	allowUnfree = true;
	allowBroken = true;
};
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";
  services.flatpak.enable = true;
  time.timeZone = "${settings.timeZone}";
  programs.steam.enable = true;


  environment.systemPackages = [
    inputs.zen-browser.packages.${pkgs.system}.default
    pkgs.swww
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  
  fonts.packages = with pkgs.nerd-fonts; [ bigblue-terminal ];



  home-manager.users.${settings.userName} = {


    home = {
                  username = settings.userName; 
                  homeDirectory = settings.homeDirectory;
                  stateVersion = "25.05";
        };












  };  

  services.displayManager.ly.enable = true;

}

