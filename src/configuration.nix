
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













    services.mpd-discord-rpc.enable = true;

    services.mpd = {
      enable = true;
      
      # Music directory
      musicDirectory = "/home/${settings.userName}/Music";
      
      # MPD directories - use XDG defaults
      dataDir = "/home/${settings.userName}/.local/share/mpd";
      playlistDirectory = "/home/${settings.userName}/.local/share/mpd/playlists";
      
      # Network settings
      network = {
        listenAddress = "127.0.0.1";
        port = 6600;
      };
      
      # PipeWire audio configuration for user service
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire Output"
        }
        
        # Fallback ALSA output
        audio_output {
          type "alsa"
          name "ALSA Output"
          device "default"
          mixer_type "software"
          enabled "no"
        }
        
        auto_update "yes"
        connection_timeout "60"
        restore_paused "yes"
      '';
    };
  };  

  services.displayManager.ly.enable = true;

}

