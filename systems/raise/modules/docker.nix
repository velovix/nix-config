{ config, pkgs, lib, libs, ... }:

{
  environment.systemPackages = with pkgs; [
    nvidia-container-toolkit
  ];

  virtualisation.docker = {
    enable = true;
    # I don't need this feature and it causes NixOS to hang on shutdown
    liveRestore = false;
    daemon.settings = {
      features = {
        # For nvidia-container-toolkit
        cdi = true;
      };
    };
  };
  users.extraGroups.docker.members = [ "tyler" ];

  hardware.nvidia-container-toolkit.enable = true;
}

