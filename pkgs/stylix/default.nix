{
  pkgs,
  settings,
  config,
  lib,
  ...
}:
{

  environment.systemPackages = with pkgs; [ adwaita-icon-theme ];
  stylix = {
    enable = true;
    image = ./transparent_1x1.png;
    fonts = {
      serif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "";
      };

      emoji = {
        package = pkgs.nerd-fonts.symbols-only;
        name = "";
      };
    };
  };

}
