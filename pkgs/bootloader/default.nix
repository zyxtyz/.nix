 { settings, pkgs, config, ... }:

{
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";  # Important for UEFI-only install
    efiInstallAsRemovable = true;  # Optional fallback install location

    extraEntries = ''
      menuentry "Boot Kali Live" {
        insmod iso9660
        search --no-floppy --set=root --label "Kali Live"
        chainloader +1
      }
    '';
  };
}


