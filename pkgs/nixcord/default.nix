{ pkgs, config, inputs, settings, lib, ... }:
{
    home-manager.users.${settings.userName} = {
            imports = [inputs.nixcord.homeModules.nixcord];


        programs.nixcord = {
            enable = true;
            vesktop.enable = true;
        };
    };
}
