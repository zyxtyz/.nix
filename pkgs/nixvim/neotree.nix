 { pkgs, ... }:

 {
	 
    programs.nixvim.plugins.neo-tree = {
      enable = true;
      filesystem = {
        followCurrentFile.enabled = true;
        filteredItems = {
          visible = true;
          hideDotfiles = false;
        };
      };
      window = {
        position = "left";
        width = 30;
      };
    };
 }
