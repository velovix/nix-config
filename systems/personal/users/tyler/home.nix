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
  ];

  programs.firefox.enable = true;

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}

