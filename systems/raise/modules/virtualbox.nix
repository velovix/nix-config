{ config, pkgs, lib, ... }:

{
  # Fixes an issue with KVM/VirtualBox compatibility introduced in kernel 6.12
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];

  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
  };
  users.extraGroups.vboxusers.members = [ "tyler" ];
}

