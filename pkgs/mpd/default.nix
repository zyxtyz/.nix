{ settings, pkgs, home-manager, ... }:

{
  # Disable system MPD service
  services.mpd.enable = false;

  # Install MPD package
  environment.systemPackages = [ pkgs.mpd ];
  
  # Add user to audio group
  users.users.${settings.userName}.extraGroups = [ "audio" ];
  
  # Configure MPD as user service via home-manager
  home-manager.users.${settings.userName} = {
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
}
