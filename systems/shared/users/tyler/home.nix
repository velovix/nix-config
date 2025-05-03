{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules
  ];

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    discord
    blender
    flashprint
  ];

  programs.firefox.enable = true;

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}

