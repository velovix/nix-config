{ config, pkgs, libs, ... }:

{
  # In future kernel versions, I may want to do this
  #boot.initrd.kernelModules = ["xe"];

  # Helps the kernel find the right module for newer Intel iGPUs
  boot.kernelParams = [ "i915.force_probe=7d55" ];

  # Turns on Nvidia drivers on X and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = false;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
}

