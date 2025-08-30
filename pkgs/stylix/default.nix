 { pkgs, settings, config, ... }:
let
  theme = import ./colorSchemes.nix {};
  in
{
	stylix = {
		autoEnable = true;
		enable = true;
		 	base16Scheme = theme.notyou;
	 };
}
