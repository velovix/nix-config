{ config, pkgs, libs, ... }:

{
  environment.systemPackages = with pkgs; [
    nvidia-container-toolkit
    # This provides access to the more legacy Nvidia Docker stuff, like the
    # nvidia runtime
    nvidia-docker
  ];

  hardware.graphics = {
    # This is necessary for virtualisation.docker.enableNvidia
    enable32Bit = true;
  };

  virtualisation.docker = {
    enable = true;
    # This may also help with legacy Nvidia Docker
    enableNvidia = true;
    # I don't need this feature and it causes NixOS to hang on shutdown
    liveRestore = false;
  };
  users.extraGroups.docker.members = [ "tyler" ];

  hardware.nvidia-container-toolkit.enable = true;
}

