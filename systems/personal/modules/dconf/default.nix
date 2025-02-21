{ lib, ... }: {
  programs.dconf.enable = true;

  programs.dconf.profiles = {
    user.databases = [{
      settings = with lib.gvariant; {
        "org/gnome/shell".enabled-extensions = [
          "pop-shell@system76.com"
        ];
        # Focus follows mouse
        "org/gnome/desktop/wm/preferences".focus-mode = "sloppy";
        # Add shortcuts to move between specific spaces
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
        # Set a desktop background
        "org/gnome/desktop/background" = {
          picture-uri = "file:///" + toString ./. + "/wallpaper.png";
          picture-uri-dark = "file:///" + toString ./. + "/wallpaper.png";
          picture-options = "zoom";
        };
        # Inherit system light/dark theme
        "org/gnome/Console" = {
          theme = "auto";
        };
      };
    }];
  };
}

