{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    gparted
  ];
}

