{ lib, ... }: {
  programs.dconf.enable = true;

  programs.dconf.profiles = {
    user.databases = [{
      settings = with lib.gvariant; {
        "org/gnome/shell".enabled-extensions = [
          "pop-shell@system76.com"
        ];
        "org/gnome/desktop/wm/preferences".focus-mode = "sloppy";
        "org/gnome/shell/keybindings" = {
          switch-to-workspace-1 = ["<Super>1"];
          switch-to-workspace-2 = ["<Super>2"];
          switch-to-workspace-3 = ["<Super>3"];
          switch-to-workspace-4 = ["<Super>4"];
          switch-to-application-1 = mkEmptyArray (type.string);
          switch-to-application-2 = mkEmptyArray (type.string);
          switch-to-application-3 = mkEmptyArray (type.string);
          switch-to-application-4 = mkEmptyArray (type.string);
        };
      };
    }];
  };
}

