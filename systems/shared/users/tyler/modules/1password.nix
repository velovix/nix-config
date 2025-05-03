{ pkgs, ... }: {
  # Makes 1password start on login
  # Unfortunately, 1password-gui does not expose a "desktopItem" attribute
  home.file.".config/autostart/1password.desktop" = {
    source = "${pkgs._1password-gui}/share/applications/1password.desktop";
  };
}

