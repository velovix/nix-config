{ inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./distrobox.nix
  ];
}

