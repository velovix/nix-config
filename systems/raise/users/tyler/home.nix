{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules
  ];
  home.stateVersion = "24.11";
}

