{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnomeExtensions.paperwm
    gnomeExtensions.auto-move-windows
    gnome-tweaks
  ];
}
