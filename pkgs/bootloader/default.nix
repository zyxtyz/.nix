 { settings, pkgs, config, ... }:

{
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";  # Important for UEFI-only install
    efiInstallAsRemovable = true;  # Optional fallback install location

  };
}


