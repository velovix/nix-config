{ pkgs, lib, ... }: {
  programs.dconf.enable = true;

  programs.dconf.profiles = {
    user.databases = [{
      settings = with lib.gvariant;
        let
          keybindings =  {
            switch-to-workspace-1 = ["<Super>1"];
            switch-to-workspace-2 = ["<Super>2"];
            switch-to-workspace-3 = ["<Super>3"];
            switch-to-workspace-4 = ["<Super>4"];
            switch-to-workspace-left = ["<Super>h"];
            switch-to-workspace-right = ["<Super>l"];
            # These shortcuts conflict with mine
            switch-to-application-1 = mkEmptyArray (type.string);
            switch-to-application-2 = mkEmptyArray (type.string);
            switch-to-application-3 = mkEmptyArray (type.string);
            switch-to-application-4 = mkEmptyArray (type.string);
            minimize = mkEmptyArray (type.string);
            screensaver = mkEmptyArray (type.string);
          };
        in rec {
          # Focus follows mouse
          "org/gnome/desktop/wm/preferences".focus-mode = "sloppy";
          # Add shortcuts to move between specific spaces
          "org/gnome/shell/keybindings" = keybindings;
          "org/gnome/desktop/wm/keybindings" = keybindings;
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
          # "Natural" scrolling
          "org/gnome/desktop/peripherals/mouse" = {
            natural-scroll = true;
          };
          # Enable fractional scaling
          "org/gnome/mutter" = {
            experimental-features = [ "scale-monitor-framebuffer" ];
          };
          "org/gnome/settings-daemon/plugins/power" = {
            sleep-inactive-ac-type = "nothing";
          };

          # Extension settings
          "org/gnome/shell".enabled-extensions = [
            pkgs.gnomeExtensions.paperwm.extensionUuid
            pkgs.gnomeExtensions.auto-move-windows.extensionUuid
          ];
          "org/gnome/shell/extensions/paperwm" = {
            cycle-height-steps = [ 0.5 1.0 ];
            cycle-width-steps = [ 0.33 0.5 1.0 ];
          };
          "org/gnome/shell/extensions/auto-move-windows" = {
            application-list = [
              "firefox.desktop:1"
              "code.desktop:2"
              "codium.desktop:2"
              "org.gnome.Console.desktop:3"
              "slack.desktop:4"
            ];
          };
        };
    }];
  };
}

